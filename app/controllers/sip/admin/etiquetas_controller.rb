# encoding: UTF-8
module Sip
  module Admin
    class EtiquetasController < BasicasController #ApplicationController 
      before_action :set_etiqueta, only: [:show, :edit, :update, :destroy]
      load_and_authorize_resource class: Sip::Etiqueta
 
      def clase 
        "Sip::Etiqueta"
      end
  
      def set_etiqueta
        @basica = Etiqueta.find(params[:id])
      end
  
      def etiqueta_params
        params.require(:etiqueta).permit(*atributos_form)
      end
  
    end
  end
end
