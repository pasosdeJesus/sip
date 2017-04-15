# encoding: UTF-8

module Sip
  module Admin
    class GruposController < Sip::Admin::BasicasController
      before_action :set_grupo, 
        only: [:show, :edit, :update, :destroy]
      load_and_authorize_resource  class: Sip::Grupo
  
      def clase 
        "Sip::Grupo"
      end
  
      def set_grupo
        @basica = Sip::Grupo.find(params[:id])
      end
  
      def atributos_index
        [ "id", "nombre"] +
          [ :usuario_ids => [] ] +
          ["observaciones", "fechacreacion", "fechadeshabilitacion" ]
      end
  
      def genclase
        'M'
      end
  
      def grupo_params
        params.require(:grupo).permit(*atributos_form)
      end
  
    end
  end
end
