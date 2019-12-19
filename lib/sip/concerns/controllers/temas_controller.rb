# frozen_string_literal: true

module Sip
  module Concerns
    module Controllers
      module TemasController

        extend ActiveSupport::Concern

        included do
          include ActionView::Helpers::AssetUrlHelper

          before_action :set_tema, only: [:show, :edit, :update, :destroy]

          load_and_authorize_resource  class: Sip::Tema, except: [:temausuario]

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
              :fondo,
              :color_fuente,
              :color_flota_subitem_fuente,
              :color_flota_subitem_fondo,
              :nav_ini,
              :nav_fin,
              :nav_fuente,
              :fondo_lista,
              :btn_primario_fondo_ini,
              :btn_primario_fondo_fin,
              :btn_primario_fuente,
              :btn_peligro_fondo_ini,
              :btn_peligro_fondo_fin,
              :btn_peligro_fuente,
              :btn_accion_fondo_ini,
              :btn_accion_fondo_fin,
              :btn_accion_fuente,
              :alerta_exito_fondo,
              :alerta_exito_fuente,
              :alerta_problema_fondo,
              :alerta_problema_fuente,
              :observaciones,
              :fechacreacion_localizada,
              :habilitado
            ]
          end

          def temausuario
            t = ::Sip::TemasHelper.tema_usuario(defined?(current_usuario) ? 
                                                current_usuario : nil) 
            render json: {
              fondo: t.fondo,
              color_fuente: t.color_fuente,
              color_flota_subitem_fuente: t.color_flota_subitem_fuente,
              color_flota_subitem_fondo: t.color_flota_subitem_fondo,
              nav_ini: t.nav_ini,
              nav_fin: t.nav_fin,
              nav_fuente: t.nav_fuente,
              fondo_lista: t.fondo_lista,
              btn_primario_fondo_ini: t.btn_primario_fondo_ini,
              btn_primario_fondo_fin: t.btn_primario_fondo_fin,
              btn_primario_fuente: t.btn_primario_fuente,
              btn_peligro_fondo_ini: t.btn_peligro_fondo_ini,
              btn_peligro_fondo_fin: t.btn_peligro_fondo_fin,
              btn_peligro_fuente: t.btn_peligro_fuente,
              btn_accion_fondo_ini: t.btn_accion_fondo_ini,
              btn_accion_fondo_fin: t.btn_accion_fondo_fin,
              btn_accion_fuente: t.btn_accion_fuente,
              alerta_exito_fondo: t.alerta_exito_fondo,
              alerta_exito_fuente: t.alerta_exito_fuente,
              alerta_problema_fondo: t.alerta_problema_fondo,
              alerta_problema_fuente: t.alerta_problema_fuente
            }, status: :ok
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

