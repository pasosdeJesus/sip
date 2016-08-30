# encoding: UTF-8
module Sip
  module Admin
    class TrelacionesController < BasicasController
      before_action :set_trelacion, only: [:show, :edit, :update, :destroy]
      load_and_authorize_resource class: Sip::Trelacion

      def clase 
        "Sip::Trelacion"
      end

      def set_trelacion
        @basica = Trelacion.find(params[:id])
      end

      def genclase
        return 'M';
      end

      def atributos_index
        ["id", "nombre", "inverso", "observaciones", 
         "fechacreacion_localizada", "fechadeshabilitacion_localizada"]
      end
 
      def atributos_form
        atributos_index
      end

      def trelacion_params
        params.require(:trelacion).permit(*atributos_form)
      end

    end
  end
end
