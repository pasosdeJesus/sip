# encoding: UTF-8
require 'rails/generators/base'

module Sip
    class AsociabasicaGenerator < Rails::Generators::Base
      desc "Asocia tabla básica con otra"

      source_root File.expand_path('../templates', __FILE__)

      argument :tablabasica, :type => :string
      argument :tabla2, :type => :string
      class_option :modelo, :type => :boolean, :default => true, 
        :desc => "Modifica modelos"  
      class_option :controlador, :type => :boolean, :default => true, 
        :desc => "Modifica controlador de tabla2"  
      class_option :test, :type => :boolean, :default => true, 
        :desc => "Genera prueba minitest para asociacion"  
      class_option :belongs_to, :type => :boolean, :default =>true, 
        :desc => 'Crea un belongs_to en un tabla2 --selección simple-- de lo contrario tabla combinada y has_many --selección múltiple'

      def genera_asociabasica
        if ENV['DISABLE_SPRING'].to_i != 1 then
          #http://makandracards.com/makandra/24525-disabling-spring-when-debugging
          puts "Ejecutar con DISABLE_SPRING=1"
          exit 1
        end
        if options.belongs_to
          puts "Para asociar #{tablabasica} con belongs_to en #{tabla2}:"
          puts "Cree migracion que incluya
          add_column :#{tabla2}, :#{nom_arch}_id, :integer
          add_foreign_key :#{tabla2}, :#{nom_arch}, column: #{nom_arch}_id"
          if File.readlines("app/models/#{tabla2}.rb").grep(/#{nom_arch}/).size == 0
            puts "Aregue a 'app/models/#{tabla2}.rb'
            belongs_to :#{nom_arch}, class_name: \"#{nom_clase}\", 
              foreign_key: \"#{nom_arch}_id\", validate: true"
            puts "Aregue a 'app/models/#{nom_arch}.rb'
            has_many :#{tabla2}, 
              class_name: \"#{tabla2.capitalize}\", 
              foreign_key: \"#{nom_arch}_id\", 
              validate: true"
          end
          puts "Modifique la vista que edita el modelo agregando
          <%= f.association :#{nom_arch},
            collection: ::#{nom_clase}.habilitados,
            include_blank: false,
            label_method: :nombre, 
            value_method: :id 
          %> "
          puts "Modifique funcion estilo #{tabla2}_params en " +
            "el controlador de la vista cambiada para agregar #{nom_arch}"
          puts "Modifique la vista show de #{tabla2} y otras que la presenten"
        else 
          puts "Para asociar #{tablabasica} con has_many en #{tabla2}:"
          puts "Cree migracion que incluya
            create_join_table :#{tabla2}, :#{tablabasica},
              table_name: :#{tabla2}_#{tablabasica}
            add_foreign_key :#{tabla2}_#{tablabasica}, :#{tablabasica},
              column: :#{tabla2}_id
            add_foreign_key :#{tabla2}_#{tablabasica}, :#{tabla2},
              column: :#{tabla2}_id, primary_key: :id"
          puts "Y de requerirse migre datos existentes"
          puts "Cree modelo para tabal combinada con"
          puts "
class AcompanamientoCasosjr < ActiveRecord::Base
	belongs_to :sivel2_sjr_casosjr, class_name: 'Sivel2Sjr::Casosjr',
    foreign_key: 'sivel2_sjr_casosjr_id', validate: true
	belongs_to :acompanamiento, class_name: '::Acompanamiento',
    foreign_key: 'acompanamiento_id', validate: true
end
          "
          puts "Agregue titulos por presentar en vistas en config/locale/es.yml"
          if File.readlines("app/models/#{tabla2}.rb").grep(/#{nom_arch}/).size == 0
            puts "Aregue a 'app/models/#{tabla2}.rb'
            has_many :#{tabla2}_#{tablabasica}, 
              class_name: \"::#{tabla2}#{nom_clase}\", 
              foreign_key: \"#{tabla2}_id\", validate: true
            has_many :#{tablabasica}, through: :#{tabla2}_#{tablabasica}, 
              class_name: \"::#{nom_clase}\" "
          end
          puts "Modifique la vista que edita el modelo #{tabla2} agregando
          <%= f.association :#{nom_arch},
            collection: ::#{nom_clase}.habilitados,
            include_blank: false,
            label_method: :nombre, 
            value_method: :id 
          %> "
          puts "Modifique funcion estilo #{tabla2}_params en " +
            "el controlador de la vista cambiada para agregar #{nom_arch}_ids => []"
          puts "Modifique la vista show de #{tabla2} y otras que la presenten"

        end

        #genera_test if options.test
        #genera_factory if options.factory
        #genera_asociacion if tabla2 != ''
      end

      private

      def genera_modelo
        template "tablabasica.rb.erb", 
          "app/models/#{nom_arch}.rb"
				generate "migration", "Create#{nom_arch.camelize} " +
					"nombre:string{500} observaciones:string{5000} " +
					"fechacreacion:date fechadeshabilitacion:date " +
					"created_at:timestamp updated_at:timestamp"
        ab='app/models/ability.rb'
        if !File.exist?(ab)
          ab='spec/dummy/app/models/ability.rb'
        end
        if File.exist?(ab) && 
          File.readlines(ab).grep(/#{nom_arch}/).size == 0
          gsub_file(
            ab, 
            /(BASICAS_PROPIAS = \[.*)/, 
            "\\1\n    ['', '#{nom_arch}'],"
          )
        end
        puts "Aregue manualmente null:false en :nombre, :fechacreacion, :created_at y :update_at en migración"
        puts "Aregue manualmente infleccion no regular en config/initializers/inflections.rb al estilo:"
        puts "  inflect.irregular '#{tablabasica}', '#{tablabasicaplural}' "
        puts "Aregue nombre en español en config/locales/es.yml al estilo:"
        puts "    \"#{tablabasica}\":"
        puts "      #{tablabasica}: Descripción singular"
        puts "      #{tablabasicaplural}: Descripción plural"
      end

      def genera_controlador
        template "tablasbasicas_controller.rb.erb", 
          "app/controllers/admin/#{nom_arch_plural}_controller.rb"
      end

      def genera_test
        template "tablabasica_test.rb.erb", 
          "test/models/#{nom_arch}_test.rb"
        template "tablasbasicas_controller_test.rb.erb", 
          "test/controllers/#{nom_arch_plural}_controller_test.rb"
      end

      def genera_factory
        template "factory_tablabasica.rb.erb", 
          "test/factories/#{nom_arch}.rb"
      end

      def genera_asociacion
      end

      def nom_arch
        tablabasica.underscore
      end

      def nom_arch_plural
        tablabasicaplural.underscore
      end

      def nom_clase
        tablabasica.capitalize
      end

      def nom_clase_plural
        tablabasicaplural.capitalize
      end
    end
end

