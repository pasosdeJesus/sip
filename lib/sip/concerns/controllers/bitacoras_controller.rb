# encoding: UTF-8

module Sip
  module Concerns
    module Controllers
      module BitacorasController

        extend ActiveSupport::Concern

        included do
          include ActionView::Helpers::AssetUrlHelper

          def clase 
            "Sip::Bitacora"
          end

          def atributos_index
            [
              :id,
              :fecha,
              :ip,
              :usuario_id,
              :url,
              :params,
              :modelo,
              :modelo_id,
              :operacion,
              :detalle
            ]
          end

          def index_reordenar(registros)
            return registros.reorder(:id)
          end

          def new_modelo_path(o)
            return new_bitacora_path()
          end

          def genclase
            return 'F'
          end


          private

          def set_bitacora
            @registro = @bitacora = Sip::Bitacora.find(params[:id].to_i)
          end

          # No confiar parametros a Internet, sólo permitir lista blanca
          def bitacora_params
            params.require(:bitacora).permit(*atributos_form)
          end

        end


      end
    end
  end
end


