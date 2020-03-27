# encoding: UTF-8

module Sip
  module Concerns
    module Models
      module Departamento
        extend ActiveSupport::Concern

        include Sip::Basica
        included do
          Nombresunicos=false  # Por ejemplo hay departamento AMAZONAS en COLOMBIA y en VENEZUELA
          self.table_name = 'sip_departamento'
          has_many :municipio, foreign_key: "id_departamento", validate: true, 
            class_name: 'Sip::Municipio'
          has_many :persona, foreign_key: "id_departamento", validate: true, 
            class_name: 'Sip::Persona'
          has_many :ubicacion, foreign_key: "id_departamento", validate: true, 
            class_name: 'Sip::Ubicacion'

          belongs_to :pais, foreign_key: "id_pais", validate: true, 
            class_name: 'Sip::Pais'

          validates :id_pais, presence: true
          
          validates_uniqueness_of :nombre, 
            scope: :id_pais,
            case_sensitive: false, 
            message: "debe ser único en el país"
          validates_uniqueness_of :id_deplocal, 
            scope: :id_pais, 
            message: "debe ser único en el país", 
            allow_blank: false

          scope :filtro_id_pais, lambda {|p|
            where(id_pais: p)
          }

          @@conf_presenta_nombre_con_origen = false
          mattr_accessor :conf_presenta_nombre_con_origen

          def presenta_nombre_con_origen
            pais = Sip::Pais.find(self.id_pais)
            self.nombre + " / " + pais.nombre
          end

          def presenta_nombre
            if @@conf_presenta_nombre_con_origen
              presenta_nombre_con_origen
            else
              self.nombre
            end
          end

        end

        class_methods do
          #mattr_accessor :conf_presenta_nombre_con_origen
        end

      end
    end
  end
end

