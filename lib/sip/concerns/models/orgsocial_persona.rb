# encoding: UTF-8

module Sip
  module Concerns
    module Models
      module OrgsocialPersona
        extend ActiveSupport::Concern

        included do
          include Sip::Modelo 
          include Sip::Localizacion

          self.table_name = 'sip_orgsocial_persona'

          belongs_to :orgsocial, class_name: 'Sip::Orgsocial',
            foreign_key: 'orgsocial_id', inverse_of: :orgsocial_persona, 
            optional: true
          belongs_to :persona, class_name: 'Sip::Persona',
            foreign_key: 'persona_id', validate: true

          accepts_nested_attributes_for :persona, reject_if: :all_blank

          belongs_to :perfilorgsocial, class_name: 'Sip::Perfilorgsocial',
            foreign_key: 'perfilorgsocial_id', validate: true, optional: true

          validates :persona, presence: true

        end # included

      end
    end
  end
end
