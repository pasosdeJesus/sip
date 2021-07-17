module Sip
  module Concerns
    module Controllers
      module TdocumentosController 
        extend ActiveSupport::Concern

        included do
          include ActionView::Helpers::AssetUrlHelper


          def clase 
            "Sip::Tdocumento"
          end

          def set_tdocumento
            @basica = Tdocumento.find(params[:id])
          end

          def genclase
            return 'M';
          end

          def atributos_index
            [
              :id, 
              :nombre, 
              :sigla, 
              :formatoregex, 
              :observaciones,
              :fechacreacion_localizada, 
              :habilitado
            ]
          end

          def tdocumento_params
            params.require(:tdocumento).permit( *(atributos_form))
          end

        end
      end
    end
  end
end
