module Sip
  module Concerns
    module Controllers
      module OficinasController

        extend ActiveSupport::Concern

        included do
          include ActionView::Helpers::AssetUrlHelper

          def clase 
            "Sip::Oficina"
          end

          def set_oficina
            @basica = Oficina.find(params[:id])
          end

          def oficina_params
            params.require(:oficina).permit(*atributos_form)
          end

        end # do

      end
    end
  end
end
