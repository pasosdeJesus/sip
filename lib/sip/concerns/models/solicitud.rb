module Sip
  module Concerns
    module Models
      module Solicitud
        extend ActiveSupport::Concern

        included do
          include Sip::Modelo 
          include Sip::Localizacion

          self.table_name = 'sip_solicitud'

          belongs_to :usuario, foreign_key: 'usuario_id', dependent: :destroy,
            class_name: 'Usuario', optional: false
          belongs_to :estadosol, foreign_key: "estadosol_id", validate: true,
            class_name: "Sip::Estadosol", optional: true

          has_and_belongs_to_many :usuarionotificar, 
            class_name: 'Usuario',
            foreign_key: :solicitud_id, 
            association_foreign_key: 'usuarionotificar_id',
            join_table: 'sip_solicitud_usuarionotificar'

          campofecha_localizado :fecha

          validates :fecha, presence: true
          validates :solicitud, length: { maximum: 5000 }, presence: true,
            allow_blank: false

        end # included

      end
    end
  end
end
