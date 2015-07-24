# encoding: UTF-8
require "devise"
require "sip/engine"

module Sip

    # Carga un archivo con semillas SQL de un motor, ruta o app
    # @param objeto conexion Tipicamente ActiveRecord::Base.connection()
    # @param string motor motor del cual cargar, o cadena con ruta 
    #   o nil para que sea de aplicación
    # @param string tipoarchivo 'cambios' o 'datos' para indicar si se carga
    #     cambios-basica.sql o datos-basica.sql. El primero debería tener cambios
    #     a tablas básicas de motor del cual desciende directamente.
    #     El segundo debería tener nuevos datos para las tablas básicas.
    #
    # @return void Si el archivo existe lo ejecuta
    def self.carga_semillas_sql(conexion, motor, tipoarchivo)
      if (tipoarchivo.to_s != 'datos' && tipoarchivo.to_s != 'cambios')
        raise 'Las semillas solo pueden ser cambios o datos'
      end
      if motor 
        if Gem.loaded_specs[motor.to_s]
          motor = Gem.loaded_specs[motor.to_s].full_gem_path + "/" 
        else  # Ruta
          motor = motor.to_s + "/"
        end
      else
        motor = "" # Aplicacion
      end
      n = "#{motor}db/#{tipoarchivo.to_s}-basicas.sql"
      if File.exists?(n) then
        l = File.readlines(n)
        conexion.execute(l.join("\n"))
      end
    end
end
