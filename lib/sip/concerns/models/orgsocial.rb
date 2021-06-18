# encoding: UTF-8

module Sip
  module Concerns
    module Models
      module Orgsocial
        extend ActiveSupport::Concern

        included do
          include Sip::Modelo 
          include Sip::Localizacion

          self.table_name = 'sip_orgsocial'

          belongs_to :grupoper, class_name: 'Sip::Grupoper',
            foreign_key: 'grupoper_id', validate: true, optional: false
          accepts_nested_attributes_for :grupoper, reject_if: :all_blank

          belongs_to :pais, class_name: 'Sip::Pais',
            foreign_key: "pais_id", validate: true, optional: true

          has_many :orgsocial_persona, 
            class_name: 'Sip::OrgsocialPersona',
            foreign_key: "orgsocial_id"
          accepts_nested_attributes_for :orgsocial_persona,
            allow_destroy: true, reject_if: :all_blank

          has_many :persona, through: :orgsocial_persona, 
            class_name: 'Sip::Persona'
          accepts_nested_attributes_for :persona, reject_if: :all_blank

          has_and_belongs_to_many :sectororgsocial, 
            class_name: 'Sip::Sectororgsocial',
            foreign_key: "orgsocial_id", 
            validate: true, 
            association_foreign_key: "sectororgsocial_id",
            join_table: 'sip_orgsocial_sectororgsocial'

          campofecha_localizado :fechadeshabilitacion

          validates :telefono, length: { maximum: 500 }
          validates :fax, length: { maximum: 500 }
          validates :direccion, length: { maximum: 500 }
          validates :web, length: { maximum: 500 }

          scope :habilitados, -> () {
            where(fechadeshabilitacion: nil)
          }

          attr_accessor :habilitado

          def habilitado
            fechadeshabilitacion.nil? ? 'Si' : 'No'
          end

          def presenta_sip(atr)
            case atr.to_s
            when "{:orgsocial_persona=>[]}"
              self.orgsocial_persona ? self.orgsocial_persona.inject("") { |memo, s|
                (memo == "" ? "" : memo + "; ") + 
                  (s.persona ? 
                   s.persona.nombres + ' ' + s.persona.apellidos : '')
              } : ""
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
            when 'sectores', Sip::Orgsocial.
              human_attribute_name(:sectoresorgsocial).downcase.gsub(' ', '_')
              self.sectororgsocial ? self.sectororgsocial.inject("") { |memo, s|
                (memo == "" ? "" : memo + "; ") + s.nombre
              } : ""
            else
              presenta_gen(atr)
            end
          end

          def presenta(atr)
            presenta_sip(atr)
          end

          def presenta_nombre
            self['grupoper_id'] ?  self.grupoper.nombre : ''
          end

          scope :filtro_grupoper_id, lambda { |g|
            where("grupoper_id=?", g)
          }

          scope :filtro_habilitado, lambda {|o|
            if o.upcase.strip == 'SI'
              where(fechadeshabilitacion: nil)
            elsif o.upcase.strip == 'NO'
              where.not(fechadeshabilitacion: nil)
            end 
          }

          scope :filtro_created_atini, lambda { |f|
            where('date(sip_orgsocial.created_at) >= ?', f)
          }

          scope :filtro_created_atfin, lambda { |f|
            where('date(sip_orgsocial.created_at) <= ?', f)
          }

          scope :filtro_sectororgsocial_ids, lambda { |s|
            joins('JOIN sip_orgsocial_sectororgsocial ON 
                  sip_orgsocial_sectororgsocial.orgsocial_id=sip_orgsocial.id').where(
              'sip_orgsocial_sectororgsocial.sectororgsocial_id=?', s)
          }

        end # included

      end
    end
  end
end
