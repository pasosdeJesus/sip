# encoding: UTF-8

# Agrega metodos de clase para facilitar detalles de 
# localización no suficientemente cubiertos en Rails:
# - Formato de fecha (concordante con Datepicker)
#
# Uso:
# Declare el formato por usar en config/application.rb
#   config.x.formato_fecha
# Con uno de los siguientes valores
#   dd-M-yyyy, dd/M/yyyy, dd-mm-yyyy y yyyy-mm-ddd
#
# En la base de datos se esperan campos de fecha en notación estándar
# de PostgreSQL anio-mes-dia, digamos fechainicio en una tabla.
#
# En su modelo agregue:
#   campofecha_localizada :fechainicio
# Y a lo largo de la aplicación utilice los nuevos metodos 
# fechacreacion_localizada y fechacreacion_localizada=
# de su modelo que leen y escriben en ue usan el formato de fechas definido en config.x.formato_fecha

module Sip
  module Localizacion
    extend ActiveSupport::Concern

    include Sip::FormatoFechaHelper

    included do
    end
  
    class_methods do  

      # La localización esta en config.x.formato_fecha que usa
      # formato de DatePicker
      def campofecha_localizado(*fields)

        fields.each do |f|

          define_method("#{f}_localizada") do
            val = read_attribute(f)
            return fecha_estandar_local val.to_s
          end # define_method

          define_method("#{f}_localizada=") do |e|
            r = fecha_local_estandar e.to_s
            return write_attribute(f, r)
          end # define_method

        end  # fields.each
      end # def

    end # class_methdos

  end # module Localizacion
end # module Sip

