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

          has_many :actorsocial_persona, 
            class_name: 'Sip::ActorsocialPersona',
            foreign_key: "actorsocial_id"

          has_many :actorsocial_sectoractor, 
            class_name: 'Sip::ActorsocialSectoractor',
            foreign_key: "actorsocial_id", validate: true, 
            dependent: :delete_all
          has_many :sectoractor, class_name: 'Sip::Sectoractor',
            through: :actorsocial_sectoractor

          validates :telefono, length: { maximum: 500 }
          validates :fax, length: { maximum: 500 }
          validates :direccion, length: { maximum: 500 }
          validates :web, length: { maximum: 500 }

          def presenta(atr)
            case atr.to_s
            when "anotaciones"
              self['grupoper_id'] ? self.grupoper.anotaciones : ""
            when "grupoper"
              self['grupoper_id'] ? self.grupoper.nombre : ""
            when "nombre"
              self['grupoper_id'] ? self.grupoper.nombre : ""
            when "pais" 
              self.pais_id ? Sip::Pais.find(self.pais_id).nombre : ""
            when "pais_id" 
              self[atr] ? Sip::Pais.find(self[atr]).nombre : ""
            when "sectores" 
              self.sectoractor ? self.sectoractor.inject("") { |memo, s|
                (memo == "" ? "" : memo + "; ") + s.nombre
              } : ""
            else
              presenta_gen(atr)
            end
          end

          def presenta_nombre
            self['grupoper_id'] ?  self.grupoper.nombre : ''
          end

          scope :filtro_grupoper_id, lambda { |g|
            where("grupoper_id=?", g)
          }

          scope :filtro_sectoractor_ids, lambda { |s|
            joins(:actorsocial_sectoractor).where(
              'actorsocial_sectoractor.sectoractor_id=?', s)
          }

        end # included

      end
    end
  end
end
