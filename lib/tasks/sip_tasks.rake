# encoding: UTF-8

require 'active_support/core_ext/object/inclusion'
require 'active_record'
require 'colorize'

#require 'byebug'

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
      q = "SELECT setval('public.#{nomt}_id_seq', MAX(id)) FROM 
          (SELECT #{maxv} as id UNION 
            SELECT MAX(id) FROM public.#{Ability::tb_modelo t}) AS s;"
      #puts q
      connection.execute(q)
    end
    # Finalmente otras tablas no basicas pero con índices
    tb = ab.nobasicas_indice_seq_con_id
    tb.each do |t|
      #puts "OJO no basica con indice, t=#{t}"
      #byebug
      connection.execute("
      SELECT setval('public.#{Ability::tb_modelo t}_id_seq', MAX(id)) FROM
          (SELECT 100 as id UNION 
            SELECT MAX(id) FROM public.#{Ability::tb_modelo t}) AS s;")
    end

  end

  # De implementacion de structure:dump de rake y de
  # https://github.com/opdemand/puppet-modules/blob/master/rails/files/databases.rakeset
  desc "Vuelca tablas básicas de aplicación en orden"
  task vuelcabasicas: :environment do
    puts "sip - vuelcabasicas"
    abcs = ActiveRecord::Base.configurations
    set_psql_env(abcs)
    connection = ActiveRecord::Base.connection()
    ab = ::Ability.new
    # Volcar primero superbasicas y otras en orden correcto
    tb = ab.tablasbasicas_prio + 
      (ab.tablasbasicas - ab.tablasbasicas_prio);
    maq = '-h ' + ENV['PGHOST'] + ' -U ' + ENV['PGUSER']
    archt = Tempfile.create(["vb", ".sql"], nil)
    filename = "db/datos-basicas.sql"
    modobj = '';
    if Rails.application.class.to_s == 'Dummy::Application' ||
        (Rails.application.class.respond_to?(:parent_name) && 
         Rails.application.class.parent_name == 'Dummy')
      # en aplicaciones de prueba de motor el modulo objetivo es el del motor
      modobj = Ability.superclass.name.deconstantize;
    end
    File.open(filename, "w") { |f| 
      f << "-- Volcado de tablas basicas\n\n"
      tb.each do |t|
        printf "%s:%s - ", t[0], t[1]
        if t[0] == modobj
          command = "pg_dump --inserts --data-only --no-privileges " +
            "--no-owner --column-inserts --table=#{Ability::tb_modelo t} " +
            "#{maq} #{Shellwords.escape(ENV['PGDB'])} " +
            "| sed -e \"s/SET lock_timeout = 0;//g\" > #{archt.to_path}"
          puts command.green
          raise "Error al volcar tabla #{Ability::tb_modelo t}" unless Kernel.system(command)
          inserto = false
          ordeno = false
          porord = []
          # Agrega volcado pero ordenando los INSERTS
          # (pues pg_dump reordena arbitrariamente haciendo que entre
          # un volcado y otro se vean diferencias con diff cuando no hay)
          #byebug
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
    set_psql_env(abcs)
    fecha = DateTime.now.strftime('%Y-%m-%d') 
    archcopia = Sip::TareasrakeHelper::nombre_volcado(Sip.ruta_volcados)
    File.open(archcopia, "w") { |f| f << "-- Volcado del #{fecha}\n\n" }
    maq = '-h ' + ENV['PGHOST'] + ' -U ' + ENV['PGUSER']
    command = "pg_dump --encoding=UTF8 -cO --column-inserts " +
      "#{maq} " +
      "#{Shellwords.escape(ENV['PGDB'])} " +
      " > #{Shellwords.escape(archcopia)}"
    puts command
    raise "Error al volcar" unless Kernel.system(command)
  end # vuelca

  desc "Restaura volcado"
  task restaura: :environment do |t|
    arch=ENV['ARCH']
    puts "Restaurar #{arch} en ambiente"
    abcs = ActiveRecord::Base.configurations
    set_psql_env(abcs)
    maq = '-h ' + ENV['PGHOST'] + ' -U ' + ENV['PGUSER']
    command = "psql " +
      "#{maq} #{Shellwords.escape(ENV['PGDB'])} " +
      " -f #{Shellwords.escape(arch)}"
    puts command
    raise "Error al restaurar #{arch}" unless Kernel.system(command)
  end # restaura

end

# de https://github.com/opdemand/puppet-modules/blob/master/rails/files/databases.rake
def set_psql_env(abcs)
  confbd = abcs.configurations.select{|c| c.env_name == Rails.env}.first
  ENV['PGHOST'] = confbd.configuration_hash[:host] if confbd.configuration_hash[:host]
  ENV['PGPORT'] = confbd.configuration_hash[:port].to_s if confbd.configuration_hash['port']
  ENV['PGPASSWORD'] = confbd.configuration_hash[:password].to_s if confbd.configuration_hash[:password]
  ENV['PGUSER'] = confbd.configuration_hash[:username].to_s if confbd.configuration_hash[:username]
  ENV['PGDB'] = confbd.configuration_hash[:database].to_s if confbd.configuration_hash[:database]
end
