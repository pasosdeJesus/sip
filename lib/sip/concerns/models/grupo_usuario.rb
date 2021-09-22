
module Sip
  module Concerns
    module Models
      module GrupoUsuario
        extend ActiveSupport::Concern

        included do
          self.table_name = 'sip_grupo_usuario'

          belongs_to :sip_grupo, class_name: 'Sip::Grupo',
            foreign_key: 'sip_grupo_id', validate: true
          belongs_to :usuario, class_name: '::Usuario',
            foreign_key: 'usuario_id', validate: true
        end

      end
    end
  end
end

