# encoding: UTF-8
module Sip
  module Admin
    class OficinasController < BasicasController #ApplicationController 
      before_action :set_oficina, only: [:show, :edit, :update, :destroy]
      load_and_authorize_resource class: Sip::Oficina
 
      def clase 
        "Sip::Oficina"
      end
  
      def set_oficina
        @basica = Oficina.find(params[:id])
      end
 
      def atributos_index
        ["id", "nombre", "observaciones", 
          "fechacreacion", "fechadeshabilitacion"]
      end
 
      def oficina_params
        params.require(:oficina).permit(*atributos_form)
      end
  
    end
  end
end
