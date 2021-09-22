
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

          has_and_belongs_to_many :usuario,
            class_name: "::Usuario", 
            foreign_key: "sip_grupo_id", 
            association_foreign_key: "usuario_id",
            join_table: 'sip_grupo_usuario',
            validate: true
        end

      end
    end
  end
end

