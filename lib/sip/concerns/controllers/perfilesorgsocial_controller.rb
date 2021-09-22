
module Sip
  module Concerns
    module Controllers
      module PerfilesorgsocialController

        extend ActiveSupport::Concern

        included do
          include ActionView::Helpers::AssetUrlHelper

          before_action :set_perfilorgsocial, 
            only: [:show, :edit, :update, :destroy]
          load_and_authorize_resource  class: Sip::Perfilorgsocial

          def clase 
            "Sip::Perfilorgsocial"
          end

          def set_perfilorgsocial
            @basica = Sip::Perfilorgsocial.find(params[:id])
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

          def perfilorgsocial_params
            params.require(:perfilorgsocial).permit(*atributos_form)
          end

        end # included

      end
    end
  end
end
