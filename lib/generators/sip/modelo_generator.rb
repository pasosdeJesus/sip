# encoding: UTF-8
require 'rails/generators/base'

module Sip
    class ModeloGenerator < Rails::Generators::Base
      desc "Genera descendiente de Sip::Modelo"

      source_root File.expand_path('../templates', __FILE__)

      argument :modelo, :type => :string
      argument :modeloplural, :type => :string
      class_option :modelo, :type => :boolean, :default => true, 
        :desc => "Genera modelo"  
      class_option :controlador, :type => :boolean, :default => true, 
        :desc => "Genera controlador"  
      class_option :test, :type => :boolean, :default => true, 
        :desc => "Genera prueba minitest para el modelo"  

      def genera_modelo
        if ENV['DISABLE_SPRING'].to_i != 1 then
          #http://makandracards.com/makandra/24525-disabling-spring-when-debugging
          puts "Ejecutar con DISABLE_SPRING=1"
          exit 1
        end
        if modelo == modeloplural
          puts "El nombre en singular debe ser diferente al nombre en plural para que opere bien agregar registros"
          exit 1
        end
        genera_modelom if options.modelo
        genera_controlador if options.controlador
        genera_test if options.test
      end

      private

      def genera_modelom
        template "modelo.rb.erb", 
          "app/models/#{nom_arch}.rb"
				generate "migration", "Create#{nom_arch.camelize} " +
					"created_at:timestamp updated_at:timestamp"
        ab='app/models/ability.rb'
        if !File.exist?(ab)
          ab='spec/dummy/app/models/ability.rb'
        end
        puts "Modifique la tabla en la migración"
        puts "Ponga autorizaciones en #{ab}"
        puts "Aregue manualmente infleccion no regular en config/initializers/inflections.rb al estilo:"
        puts "  inflect.irregular '#{modelo}', '#{modeloplural}' "
        puts "Aregue nombre en español en config/locales/es.yml al estilo:"
        puts "    \"#{modelo}\":"
        puts "      #{modelo}: Descripción singular"
        puts "      #{modeloplural}: Descripción plural"
      end

      def genera_controlador
        template "modelos_controller.rb.erb", 
          "app/controllers/#{nom_arch_plural}_controller.rb"
      end

      def genera_test
        template "modelo_test.rb.erb", 
          "test/models/#{nom_arch}_test.rb"
        template "modelos_controller_test.rb.erb", 
          "test/controllers/#{nom_arch_plural}_controller_test.rb"
      end

      def nom_arch
        modelo.underscore
      end

      def nom_arch_plural
        modeloplural.underscore
      end

      def nom_clase
        modelo.capitalize
      end

      def nom_clase_plural
        modeloplural.capitalize
      end
    end
end

