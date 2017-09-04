# encoding: UTF-8

module Sip
  module Concerns
    module Models
      module Usuario
        extend ActiveSupport::Concern
        include Sip::Modelo
        include Sip::Localizacion

        included do
          self.table_name = 'usuario'
          scope :habilitados, -> (campoord = "nusuario") {
            where(fechadeshabilitacion: nil).order(campoord.to_sym)
          }
          @current_usuario = -1
          attr_accessor :current_usuario

          # Otros modulos de devise disponibles:
          # :recoverable :registerable, :confirmable, :timeoutable and :omniauthable
          devise :database_authenticatable, :rememberable, 
            :trackable, :lockable

          campofecha_localizado :fechacreacion
          campofecha_localizado :fechadeshabilitacion
          campofecha_localizado :created_at

          has_many :sip_grupo_usuario, class_name: "Sip::GrupoUsuario",
            foreign_key: "usuario_id", validate: true,
            dependent: :delete_all
          has_many :sip_grupo, through: :sip_grupo_usuario,
            class_name: "Sip::Grupo"

          #http://stackoverflow.com/questions/1200568/using-rails-how-can-i-set-my-primary-key-to-not-be-an-integer-typed-column
          self.primary_key=:id

          def email_required?
            false
          end
          validates_uniqueness_of :nusuario, :case_sensitive => false
          validates_format_of :nusuario, 
            :with  => /\A[a-zA-Z_0-9]+[-.a-zA-Z_0-9]*\z/

          # NO se valida longitud de nusuario para permitir
          # cambiarla en aplicaciones o motores que usen este --pero
          # debe hacerse alli
          # validates_length_of :nusuario, maximum: 15 
          validates_presence_of :nusuario
          validates_length_of :nusuario, maximum: Sip.longitud_nusuario
 
          #validates_length_of :nombre, maximum: 50, unless: 'nombre.nil?'
          validates_length_of :password, maximum: 64
          validates_length_of :descripcion, maximum: 50

          validates_presence_of :idioma
          validates_length_of :idioma, maximum: 6

          validates_presence_of :rol

          validates_uniqueness_of :email, :case_sensitive => false
          validates_presence_of :email
          validates_length_of :email, maximum: 255

          validates_presence_of :sign_in_count

          validates_presence_of :fechacreacion
          validate :fechacreacion_posible?
          def fechacreacion_posible?
            if !fechacreacion || fechacreacion < Date.new(2001,1,1)
              errors.add(:fechacreacion, 'Debe ser reciente (posterior a 2001)')
            end
          end

          validate :fechadeshabilitacion_posible?
          def fechadeshabilitacion_posible?
            if (!fechadeshabilitacion.blank? && fechadeshabilitacion < fechacreacion)
              errors.add(:fechadeshabilitacion, 'Debe ser posterior a la de creación')
            end
          end

          validates_presence_of   :encrypted_password, :on=>:create
          validates_confirmation_of   :encrypted_password, :on=>:create

          def confirmation_token=(value)
            if value == '' 
              value = nil;
            end
            super(value);
          end

          def presenta_nombre
            r = self.nusuario
            if self.nombre
              r += ' - ' + self.nombre
            end
            r 
          end

          def presenta(atr)
            if (atr == 'rol')
              a = Ability::ROLES.select { |v| v[1] == rol }
              a.first[0]
            else
              presenta_gen(atr)
            end
          end

          scope :filtro_nusuario, lambda { |u|
              where(nusuario: u)
          }

          scope :filtro_nombre, lambda { |n|
              where("unaccent(nombre) ILIKE '%' || unaccent(?) || '%'", 
                    n)
          }

          scope :filtro_descripcion, lambda { |d|
              where("unaccent(descripcion) ILIKE '%' || 
                    unaccent(?) || '%'", d)
          }

          scope :filtro_rol, lambda { |r|
              where(rol: r)
          }

          scope :filtro_idioma, lambda { |i|
              where(idioma: i)
          }

          scope :filtro_email, lambda { |e|
              where("unaccent(email) ILIKE '%' || 
                    unaccent(?) || '%'", e)
          }

        end

        class_methods do

        end
      end
    end
  end
end

