# encoding: UTF-8

module Sip
  module Concerns
    module Models
      module ActorsocialPersona
        extend ActiveSupport::Concern

        included do
          include Sip::Modelo 
          include Sip::Localizacion

          self.table_name = 'sip_actorsocial_persona'

          belongs_to :actorsocial, class_name: 'Sip::Actorsocial',
            foreign_key: 'actorsocial_id', inverse_of: :actorsocial_persona, 
            optional: true
          belongs_to :persona, class_name: 'Sip::Persona',
            foreign_key: 'persona_id', validate: true
          belongs_to :perfilactorsocial, class_name: 'Sip::Perfilactorsocial',
            foreign_key: 'perfilactorsocial_id', validate: true, optional: true

          validates :persona, presence: true

        end # included

      end
    end
  end
end
