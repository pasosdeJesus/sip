# encoding: UTF-8

module Sip
  module Concerns
    module Models
      module Actorsocial
        extend ActiveSupport::Concern

        included do
          include Sip::Modelo 
          include Sip::Localizacion

          self.table_name = 'sip_actorsocial'

          belongs_to :grupoper, class_name: 'Sip::Grupoper',
            foreign_key: 'grupoper_id', validate: true
          accepts_nested_attributes_for :grupoper, reject_if: :all_blank

          belongs_to :pais, class_name: 'Sip::Pais',
            foreign_key: "pais_id", validate: true

          validates :telefono, length: { maximum: 500 }
          validates :fax, length: { maximum: 500 }
          validates :direccion, length: { maximum: 500 }
          validates :web, length: { maximum: 500 }
          validates :observaciones, length: { maximum: 5000 }

          def presenta(atr)
            case atr.to_s
            when "pais_id" 
              self[atr] ? Sip::Pais.find(self[atr]).nombre : ""
            when "grupoper"
              self['grupoper_id'] ? self.grupoper.nombre : ""
            else
              presenta_gen(atr)
            end
          end

        end # included

      end
    end
  end
end
