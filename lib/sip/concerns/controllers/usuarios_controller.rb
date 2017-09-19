# encoding: UTF-8

require 'bcrypt'

module Sip
  module Concerns
    module Controllers
      module UsuariosController

        extend ActiveSupport::Concern

        included do
          include ActionView::Helpers::AssetUrlHelper

          before_action :set_usuario, only: [:show, :edit, :update, :destroy]

          def clase
            "::Usuario"
          end

          def atributos_index
            [ "id",
              "nusuario",
              "nombre",
              "descripcion",
              "rol",
              "email",
              "created_at_localizada"
            ]
          end

          def atributos_form
            r = [ 
              "nusuario",
              "nombre",
              "descripcion",
              "rol",
              "email",
            ]
            if can?(:manage, Sip::Grupo)
              r += ["sip_grupo"]
            end
            r += [
              "idioma",
              "encrypted_password",
              "fechacreacion_localizada",
              "fechadeshabilitacion_localizada",
              "failed_attempts",
              "unlock_token",
              "locked_at"
            ]
          end

          def index_reordenar(registros)
            registros.reorder('LOWER(nusuario)')
          end

          def new_modelo_path
            new_usuario_path()
          end

          def genclase
            'M'
          end

          def sip_pre_create
            authorize! :edit, ::Usuario
            params[:usuario][:encrypted_password] = BCrypt::Password.
              create(params[:usuario][:encrypted_password],
                     {:cost => Rails.application.config.devise.stretches})
          end
          
          def create
            sip_pre_create
            super
          end
        
         def update
           authorize! :edit, ::Usuario
           if (!params[:usuario][:encrypted_password].nil? &&
               params[:usuario][:encrypted_password] != "")
             params[:usuario][:encrypted_password] = BCrypt::Password.create(
               params[:usuario][:encrypted_password],
               {:cost => Rails.application.config.devise.stretches})
           else
             params[:usuario].delete(:encrypted_password)
           end
           super
         end 

          #  Configuración común
          def set_usuario
            @usuario = ::Usuario.find(params[:id])
            @usuario.current_usuario = current_usuario
            @registro = @usuario
          end

          def current_user
            current_usuario
          end

          # Lista blanca de paramétros
          def usuario_params
            p = params.require(:usuario).permit(
              :id, :nusuario, :password, 
              :nombre, :descripcion, :oficina_id,
              :rol, :idioma, :email, :encrypted_password, 
              :fechacreacion_localizada, :fechadeshabilitacion_localizada, 
              :reset_password_token, 
              :reset_password_sent_at, :remember_created_at, :sign_in_count, 
              :current_sign_in_at, :last_sign_in_at, :current_sign_in_ip, 
              :failed_attempts, :unlock_token, :locked_at,
              :last_sign_in_ip, :etiqueta_ids => []
            )
            return p
          end

        end  # included

      end
    end
  end
end

