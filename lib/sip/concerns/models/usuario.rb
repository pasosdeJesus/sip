# encoding: UTF-8

module Sip
  module Concerns
    module Models
      module Usuario
        extend ActiveSupport::Concern

        included do
          @current_usuario = -1
          attr_accessor :current_usuario

          # Otros modulos de devise disponibles:
          # :recoverable :registerable, :confirmable, :timeoutable and :omniauthable
          devise :database_authenticatable, :rememberable, :trackable, :lockable

          #http://stackoverflow.com/questions/1200568/using-rails-how-can-i-set-my-primary-key-to-not-be-an-integer-typed-column
          self.primary_key=:id

          def email_required?
            false
          end
          validates_uniqueness_of :nusuario, :case_sensitive => false
          validates_format_of :nusuario, :with  => /\A[a-zA-Z_0-9]+\z/
          validates_length_of :nusuario, maximum: 15
          validates_presence_of :nusuario
 
          validates_length_of :nombre, maximum: 50
          
          validates_length_of :descripcion, maximum: 50

          validates_presence_of :idioma
          validates_length_of :idioma, maximum: 6

          validates_presence_of :rol

          validates_uniqueness_of :email, :case_sensitive => false
          validates_presence_of :email
          validates_length_of :email, maximum: 255

          validates_presence_of :sign_in_count

          validates_presence_of :fechacreacion

          validates_presence_of   :encrypted_password, :on=>:create
          validates_confirmation_of   :encrypted_password, :on=>:create
        end
      end
    end
  end
end

