
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
            r = [ 
              :id,
              :nusuario,
              :nombre,
              :descripcion,
              :rol,
              :email,
              :tema
            ]
            if can?(:manage, Sip::Grupo)
              r += [:sip_grupo]
            end
            r += [ :created_at_localizada,
              :habilitado
            ]
            r
          end

          def atributos_form
            r = [ 
              :nusuario,
              :nombre,
              :descripcion,
              :rol,
              :email,
              :tema
            ]
            if can?(:manage, Sip::Grupo)
              r += [:sip_grupo]
            end
            r += [
              :idioma,
              :encrypted_password,
              :fechacreacion_localizada,
              :fechadeshabilitacion_localizada,
              :failed_attempts,
              :unlock_token,
              :locked_at
            ]
          end

          def index_reordenar(registros)
            registros.reorder(Arel.sql('LOWER(nusuario)'))
          end

          def new_modelo_path
            new_usuario_path()
          end

          def genclase
            'M'
          end

          def editar_intermedio(registro, usuario_actual_id)
            registro.encrypted_password = ''  # Si es vacía no se cambiará
          end

          def sip_pre_create
            params[:usuario][:encrypted_password] = BCrypt::Password.
              create(params[:usuario][:encrypted_password],
                     {:cost => Rails.application.config.devise.stretches})
          end

          def create
            sip_pre_create
            super
          end

         def update
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

          def lista_params_sip
            r = [
              :id, 
              :nusuario, 
              :password, 
              :nombre, 
              :descripcion, 
              :oficina_id,
              :rol, 
              :idioma, 
              :email, 
              :tema_id, 
              :encrypted_password,
              :fechacreacion_localizada, 
              :fechadeshabilitacion_localizada, 
              :reset_password_token, 
              :reset_password_sent_at, 
              :remember_created_at, 
              :sign_in_count, 
              :current_sign_in_at, 
              :last_sign_in_at, 
              :current_sign_in_ip, 
              :failed_attempts, 
              :unlock_token, 
              :locked_at,
              :last_sign_in_ip, 
            ] + [ 
              :etiqueta_ids => [] 
            ] + [
              :sip_grupo_ids => []
            ]
            r
          end

          def lista_params
            lista_params_sip
          end

          # Lista blanca de paramétros
          def usuario_params
            p = params.require(:usuario).permit(lista_params)
            return p
          end

        end  # included

      end
    end
  end
end

