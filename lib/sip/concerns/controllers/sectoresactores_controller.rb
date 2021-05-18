# encoding: UTF-8

module Sip
  module Concerns
    module Controllers
      module SectoresactoresController 
        extend ActiveSupport::Concern

        included do
          include ActionView::Helpers::AssetUrlHelper

          before_action :set_sectoractor, 
            only: [:show, :edit, :update, :destroy]
          load_and_authorize_resource  class: Sip::Sectoractor

          def clase 
            "Sip::Sectoractor"
          end

          def set_sectoractor
            @basica = Sip::Sectoractor.find(params[:id])
          end

          def atributos_index
            [
              :id, 
              :nombre, 
              :observaciones, 
              :fechacreacion_localizada, 
              :habilitado
            ]
          end

          def genclase
            'M'
          end

          def sectoractor_params
            params.require(:sectoractor).permit(*atributos_form)
          end

        end

      end
    end
  end
end
