# encoding: UTF-8

module Sip
  module Concerns
    module Models
      module Trelacion
        extend ActiveSupport::Concern

        include Sip::Basica
        included do
          has_many :persona_trelacion, foreign_key: "id_trelacion", 
            validate: true, class_name: 'Sip::PersonaTrelacion'
         
          # no puede usarse cuando es la misma
          #belongs_to :invtrelacion, foreign_key: "inverso", 
          #validate: true, class_name: 'Sip::Trelacion'

          validates :id, presence: true, allow_blank: false, 
            length: { maximum: 2} 
          validates_uniqueness_of :id, case_sensitive: false
          validates :inverso, presence: true, allow_blank: false, 
            length: { maximum: 2} 
          validates :observaciones, length: { maximum: 200}

          validate :inverso_existe

          def inverso_existe
            if (inverso.present? && inverso != id &&
                Sip::Trelacion.where(id: inverso).take == nil)
              errors.add :inverso, "no existe relacion con ese código"
            end
          end

          def id=(val)
            self[:id] = val.upcase.squish if val
          end

          def inverso=(val)
            self[:inverso] = val.upcase.squish if val
          end

        end

      end
    end
  end
end

