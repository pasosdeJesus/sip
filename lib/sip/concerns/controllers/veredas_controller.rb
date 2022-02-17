# frozenn_string_literal: true

module Sip
  module Concerns
    module Controllers
      module VeredasController

        extend ActiveSupport::Concern

        included do
          include ActionView::Helpers::AssetUrlHelper

          def clase
            "Sip::Vereda"
          end

          def index
            c = nil
            if params[:municipio_id] && params[:municipio_id].to_i > 0
              idmun = params[:municipio_id].to_i
              c = Sip::Vereda.where(
                fechadeshabilitacion:nil,
                municipio_id: idmun).all
            end
            Sip::Municipio.conf_presenta_nombre_con_departamento = true
            super(c)
          end

          def set_vereda
            @basica = Vereda.find(params[:id])
          end

          def atributos_index
            [
              :id,
              :nombre,
              :pais,
              :departamento,
              :municipio_id, # belongs_to
              :verlocal_id,
              :latitud,
              :longitud,
              :observaciones,
              :fechacreacion_localizada,
              :habilitado
            ]
          end

          def atributos_form
            Sip::Municipio.conf_presenta_nombre_con_origen = true
            atributos_transf_habilitado -
              [:id, 'id', :pais, 'pais,', :departamento, 'departamento']
          end

          def genclase
            return 'F';
          end

          def vereda_params
            params.require(:vereda).permit( *atributos_form)
          end

        end
      end
    end
  end
end

