# encoding: UTF-8

module Sip
  module Concerns
    module Controllers
      module PerfilesactorsocialController

        extend ActiveSupport::Concern

        included do
          include ActionView::Helpers::AssetUrlHelper

          before_action :set_perfilactorsocial, 
            only: [:show, :edit, :update, :destroy]
          load_and_authorize_resource  class: Sip::Perfilactorsocial

          def clase 
            "Sip::Perfilactorsocial"
          end

          def set_perfilactorsocial
            @basica = Sip::Perfilactorsocial.find(params[:id])
          end

          def atributos_index
            [
              "id", 
              "nombre", 
              "observaciones", 
              "fechacreacion_localizada", 
              "fechadeshabilitacion_localizada"
            ]
          end

          def genclase
            'M'
          end

          def perfilactorsocial_params
            params.require(:perfilactorsocial).permit(*atributos_form)
          end

        end # included

      end
    end
  end
end
