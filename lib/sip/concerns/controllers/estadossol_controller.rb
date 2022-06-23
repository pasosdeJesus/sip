
module Sip
  module Concerns
    module Controllers
      module EstadossolController 
        extend ActiveSupport::Concern

        included do
          include ActionView::Helpers::AssetUrlHelper


          def clase 
            "Sip::Estadosol"
          end

          def set_estadosol
            @basica = @estadosol = Estadosol.find(params[:id])
          end

          def genclase
            return 'M';
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

          def estadosol_params
            params.require(:estadosol).permit( *(atributos_form))
          end

        end
      end
    end
  end
end
