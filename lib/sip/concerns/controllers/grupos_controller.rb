# encoding: UTF-8

module Sip
  module Concerns
    module Controllers
      module GruposController

        extend ActiveSupport::Concern

        included do
          include ActionView::Helpers::AssetUrlHelper

          before_action :set_grupo, 
            only: [:show, :edit, :update, :destroy]

          def clase 
            "Sip::Grupo"
          end

          def atributos_index
            [ "id", "nombre"] +
              [ :usuario_ids => [] ] +
              ["observaciones", "fechacreacion", "fechadeshabilitacion" ]
          end

          def genclase
            'M'
          end

          def set_grupo
            @registro = @basica = Sip::Grupo.find(params[:id])
          end

          def grupo_params
            params.require(:grupo).permit(*atributos_form)
          end

        end # include


      end
    end
  end
end
