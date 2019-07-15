# frozen_string_literal: true

module Sip
  module Concerns
    module Controllers
      module TemasController

        extend ActiveSupport::Concern

        included do
          include ActionView::Helpers::AssetUrlHelper

          before_action :set_tema, only: [:show, :edit, :update, :destroy]

          load_and_authorize_resource  class: Sip::Tema

          def clase
            'Sip::Tema'
          end

          def set_tema
            @basica = Sip::Tema.find(params[:id])
          end

          def atributos_index
            [
              :id,
              :nombre,
              :nav_ini,
              :nav_fin,
              :nav_fuente,
              :fondo_lista,
              :observaciones,
              :fechacreacion_localizada,
              :habilitado
            ]
          end

          def genclase
            'M'
          end

          def tema_params
            params.require(:tema).permit(*atributos_form)
          end

        end #included

      end 
    end
  end
end

