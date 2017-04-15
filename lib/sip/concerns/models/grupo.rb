# encoding: UTF-8

module Sip
  module Concerns
    module Models
      module Grupo
        extend ActiveSupport::Concern

        include Sip::Basica

        included do
          self.table_name = 'sip_grupo'

          # Nombre de grupo puede tener minúscula/mayúscula
          def nombre=(val)
            self[:nombre] = val.squish if val
          end

          has_many :sip_grupo_usuario,
            class_name: "Sip::GrupoUsuario", 
            foreign_key: "sip_grupo_id", validate: true,
            dependent: :delete_all
          has_many :usuario, through: :sip_grupo_usuario,
            class_name: "::Usuario"
        end

      end
    end
  end
end

