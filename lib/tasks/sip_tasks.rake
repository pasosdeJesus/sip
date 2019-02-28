# encoding: UTF-8

require 'active_support/core_ext/object/inclusion'
require 'active_record'
require 'colorize'

require_relative '../../app/helpers/sip/tareasrake_helper'

namespace :sip do
  desc "Actualiza indices"
  task indices: :environment do
    connection = ActiveRecord::Base.connection();
    puts "sip - indices"
		# Primero tablas basicas creadas en Rails
    #byebug
    ab = ::Ability.new
    tbn = ab.tablasbasicas - ab.basicas_id_noauto
    tbn.each do |t|
      #puts "OJO tbn, t=#{t}"
			nomt = Ability::tb_modelo t
			case nomt
			when 'sip_departamento', 'sip_municipio', 'sip_pais', 'sip_clase'
				maxv = 100000
			else	
				maxv = 100
			end
			q = "SELECT setval('#{nomt}_id_seq', MAX(id)) FROM 
          (SELECT #{maxv} as id UNION 
            SELECT MAX(id) FROM #{Ability::tb_modelo t}) AS s;"
		  #puts q
    	connection.execute(q)
		end
    # Finalmente otras tablas no basicas pero con índices
    tb = ab.nobasicas_indice_seq_con_id
    tb.each do |t|
      #puts "OJO no basica con indice, t=#{t}"
      #byebug
      connection.execute("
      SELECT setval('#{Ability::tb_modelo t}_id_seq', MAX(id)) FROM
          (SELECT 100 as id UNION 
            SELECT MAX(id) FROM #{Ability::tb_modelo t}) AS s;")
    end

  end

	# De implementacion de structure:dump de rake y de
	# https://github.com/opdemand/puppet-modules/blob/master/rails/files/databases.rakeset
  desc "Vuelca tablas básicas de aplicación en orden"
  task vuelcabasicas: :environment do
    puts "sip - vuelcabasicas"
		abcs = ActiveRecord::Base.configurations
    set_psql_env(abcs[Rails.env])
    search_path = abcs[Rails.env]['schema_search_path']
    connection = ActiveRecord::Base.connection()
    ab = ::Ability.new
		# Asegurasmo que primero se vuelcan superbasicas y otras en orden correcto
    tb = ab.tablasbasicas_prio + 
      (ab.tablasbasicas - ab.tablasbasicas_prio);
    unless search_path.blank?
      search_path = search_path.split(",").map{|search_path_part| 
        "--schema=#{Shellwords.escape(search_path_part.strip)}" 
      }.join(" ")
    end
    archt = Tempfile.create(["vb", ".sql"], nil)
		filename = "db/datos-basicas.sql"
    modobj = '';
    if Rails.application.class.parent_name == 'Dummy'
      # en aplicaciones de prueba de motor el modulo objetivo es el del motor
      modobj = Ability.superclass.name.deconstantize;
    end
    File.open(filename, "w") { |f| 
      f << "-- Volcado de tablas basicas\n\n"
      tb.each do |t|
        printf "%s:%s - ", t[0], t[1]
        if t[0] == modobj
          command = "pg_dump --inserts --data-only --no-privileges --no-owner --column-inserts --table=#{Ability::tb_modelo t}  #{search_path} #{Shellwords.escape(abcs[Rails.env]['database'])} | sed -e \"s/SET lock_timeout = 0;//g\" >> #{archt.to_path}"
          puts command.green
          raise "Error al volcar tabla #{Ability::tb_modelo t}" unless Kernel.system(command)
          inserto = false
          ordeno = false
          porord = []
          # Agrega volcado pero ordenando los INSERTS
          # (pues pg_dump reordena arbitrariamente haciendo que entre
          # un volcado y otro se vean diferencias con diff cuando no hay)
          File.open(archt.to_path, "r") { |ent| 
            ent.each_line { |line| 
              if line[0,6] == "INSERT"
                inserto=true
                porord << line
              else
                if !inserto || (inserto && ordeno) 
                  f << line
                else
                  porord.sort!
                  porord.each { |l|
                    f << l
                  }
                  ordeno = true
                  f << line
                end
              end
            }
          }
        else
          puts "Saltando".red
        end
        
      end
    }
  end

 	desc "Actualiza tablas básicas"
	task actbasicas: :environment do
    puts "sip - actbasicas"
		value = %x(
			pwd
			rails dbconsole <<-EOF
        \\i db/datos-basicas.sql
      EOF
		)
  end

	desc "Vuelca base de datos completa"
  task vuelca: :environment do
    puts "sip - vuelca"
		abcs = ActiveRecord::Base.configurations
		fecha = DateTime.now.strftime('%Y-%m-%d') 
    archcopia = Sip::TareasrakeHelper::nombre_volcado(Sip.ruta_volcados)
		File.open(archcopia, "w") { |f| f << "-- Volcado del #{fecha}\n\n" }
		set_psql_env(abcs[Rails.env])
		search_path = abcs[Rails.env]['schema_search_path']
		unless search_path.blank?
			search_path = search_path.split(",").map{|search_path_part| 
        "--schema=#{Shellwords.escape(search_path_part.strip)}" 
      }.join(" ")
		end
		command = "pg_dump --encoding=UTF8 -cO --column-inserts " +
      "#{search_path} #{Shellwords.escape(abcs[Rails.env]['database'])} " +
      " > #{Shellwords.escape(archcopia)}"
		puts command
		raise "Error al volcar" unless Kernel.system(command)
	end	

  desc "Restaura volcado"
  task restaura: :environment do |t|
    arch=ENV['ARCH']
    puts "Restaurar #{arch} en ambiente"
		abcs = ActiveRecord::Base.configurations
		set_psql_env(abcs[Rails.env])
		search_path = abcs[Rails.env]['schema_search_path']
		unless search_path.blank?
			search_path = search_path.split(",").map{|search_path_part| 
        "--schema=#{Shellwords.escape(search_path_part.strip)}" 
      }.join(" ")
		end
		command = "psql " +
      "#{search_path} #{Shellwords.escape(abcs[Rails.env]['database'])} " +
      " -f #{Shellwords.escape(arch)}"
		puts command
		raise "Error al restaurar #{arch}" unless Kernel.system(command)
  end
end

# de https://github.com/opdemand/puppet-modules/blob/master/rails/files/databases.rake
def set_psql_env(config)
	ENV['PGHOST']     = config['host']          if config['host']
	ENV['PGPORT']     = config['port'].to_s     if config['port']
	ENV['PGPASSWORD'] = config['password'].to_s if config['password']
	ENV['PGUSER']     = config['username'].to_s if config['username']
end
