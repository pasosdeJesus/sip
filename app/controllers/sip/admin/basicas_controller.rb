# encoding: UTF-8
module Sip
  module Admin
    class BasicasController < Sip::ModelosController
      include BasicasHelpers
      helper BasicasHelpers

      # Nombre de la tabla básica
      def clase 
        "Sip::BasicaCambiar"
      end

      # Nombre del campo con nombre que identifica cada registro
      def camponombre
        return :nombre
      end

      # Campos de la tabla
      def atributos_index
        ["id", 
         "nombre", 
         "observaciones", 
         "fechacreacion_localizada", 
         "habilitado"
        ]
      end

      # Campos por mostrar en presentación de un registro
      def atributos_show
        r = atributos_index - ['habilitado', :habilitado]
        if !r.include?("fechadeshabilitacion_localizada") &&
          !r.include?(:fechadeshabilitacion_localizada) &&
          !r.include?(:fechadeshabilitacion) &&
          !r.include?('fechadeshabilitacion')
          r << "fechadeshabilitacion_localizada"
        end
        r
      end

      # Campos que se presentar en formulario
      def atributos_form
        atributos_show - ["id", :id]
      end

      def index_reordenar(c)
        c.reorder([:nombre])
      end


      helper_method :clase, :atributos_index, :atributos_form, 
        :genclase, :camponombre
    end
  end
end
