# frozen_string_literal: true

module Sip
  module Concerns
    module Controllers
      module PaisesController

        extend ActiveSupport::Concern

        included do
          include ActionView::Helpers::AssetUrlHelper

          def clase 
            "Sip::Pais"
          end

          def set_pais
            @basica = Pais.find(params[:id])
          end

          def atributos_index
            [ :id, 
              :nombre, 
              :nombreiso_espanol, 
              :latitud, 
              :longitud, 
              :alfa2, 
              :alfa3, 
              :codiso, 
              :nombreiso_ingles,
              :nombreiso_frances,
              :div1, 
              :div2, 
              :div3, 
              :observaciones,
              :ultvigenciaini,
              :ultvigenciafin,
              :fechacreacion_localizada, 
              :habilitado
            ]
          end

          def atributos_form
            atributos_transf_habilitado
          end

          def genclase
            return 'M';
          end

          def pais_params
            params.require(:pais).permit(*atributos_form)
          end

        end # included

      end
    end
  end
end
