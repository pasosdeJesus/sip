module Sip
  module TareasrakeHelper

    # Asegura que están establecidas variables de ambiente con información
    # para conexión a la base de datos: BD_SERVIDOR, BD_USUARIO, BD_CLAVE,
    # BD_NOMBRE
    def asegura_varambiente_bd
      # Toma ideas de https://github.com/opdemand/puppet-modules/blob/master/rails/files/databases.rake
      abcs = ActiveRecord::Base.configurations
      confbd = abcs.configurations.select{|c| c.env_name == Rails.env}.first

      if !ENV['BD_SERVIDOR']
        ENV['BD_SERVIDOR'] = confbd.configuration_hash[:host] || 
          '/var/www/var/run/postgresql'
      end
      if !ENV['BD_USUARIO']
        ENV['BD_USUARIO'] = confbd.configuration_hash[:username] || 
          'sipdes'
      end
      if !ENV['BD_CLAVE']
        ENV['BD_CLAVE'] = confbd.configuration_hash[:password] || 
          'CambiarPorClave'
      end
      if Rails.env == 'production'
        ENV['BD_NOMBRE'] = ENV.fetch(
          'BD_PRO', confbd.configuration_hash[:database] || 'bdproduccion')
      elsif Rails.env == 'development'
        ENV['BD_NOMBRE'] = ENV.fetch(
          'BD_DES', confbd.configuration_hash[:database] || 'bddesarrollo')
      else
        ENV['BD_NOMBRE'] = ENV.fetch(
          'BD_PRUEBA', confbd.configuration_hash[:database] || 'bdprueba')
      end
    end
    module_function :asegura_varambiente_bd


    # Nombre de archivo con copia de volcado de base de hoy
    def nombre_volcado(ruta_volcados, rapido=false)
      dia = DateTime.now.strftime('%d') 
      asegura_varambiente_bd
      crapido = rapido ? "-rapido" : ""
      return ruta_volcados + "/" + ENV.fetch('BD_NOMBRE') +
        "-" + dia + crapido +".sql"
    end
    module_function :nombre_volcado

    # http://stackoverflow.com/questions/2108727/which-in-ruby-checking-if-program-exists-in-path-from-ruby
    def which(cmd)
      exts = ENV['PATHEXT'] ? ENV['PATHEXT'].split(';') : ['']
      ENV['PATH'].split(File::PATH_SEPARATOR).each do |path|
        exts.each { |ext|
          exe = File.join(path, "#{cmd}#{ext}")
          return exe if File.executable?(exe) && !File.directory?(exe)
        }
      end
      return nil
    end
    module_function :which


  end
end
