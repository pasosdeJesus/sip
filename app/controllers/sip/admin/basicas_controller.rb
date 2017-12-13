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
        ["id", "nombre", "observaciones", 
         "fechacreacion_localizada", "fechadeshabilitacion_localizada"]
      end

      # Campos que se esperan del formulario
      def atributos_form
        atributos_index - ["id"]
      end

      def index_reordenar(c)
        c.reorder([:nombre])
      end


      helper_method :clase, :atributos_index, :atributos_form, 
        :genclase, :camponombre
    end
  end
end
