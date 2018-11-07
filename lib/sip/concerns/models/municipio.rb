# encoding: UTF-8

module Sip
  module Concerns
    module Models
      module Municipio
        extend ActiveSupport::Concern

        include Sip::Basica
        included do
          Nombresunicos=false  # Por ejemplo hay departamento AMAZONAS en COLOMBIA y en VENEZUELA
          self.table_name = 'sip_municipio'

          has_many :clase, foreign_key: "id_municipio", validate: true, 
            class_name: 'Sip::Clase'
          has_many :persona, foreign_key: "id_municipio", validate: true, 
            class_name: 'Sip::Persona'
          has_many :ubicacion, foreign_key: "id_municipio", validate: true, 
            class_name: 'Sip::Ubicacion'

          belongs_to :departamento, foreign_key: "id_departamento", 
            validate: true, class_name: 'Sip::Departamento'

          validates :id_departamento, presence: true

          validates_uniqueness_of :nombre, 
            scope: :id_departamento,
            case_sensitive: false, 
            message: "debe ser único en el departamento/estado"
          validates_uniqueness_of :id_munlocal,
            scope: :id_departamento,
            case_sensitive: false, 
            message: "debe ser único en el departamento/estado",
            allow_blank: true

          @@conf_presenta_nombre_con_origen = false
          mattr_accessor :conf_presenta_nombre_con_origen

          @@conf_presenta_nombre_con_departamento = false
          mattr_accessor :conf_presenta_nombre_con_departamento


          def presenta_nombre_con_departamento
            dep= Sip::Departamento.find(self.id_departamento)
            self.nombre + " / " + dep.nombre 
          end

          def presenta_nombre_con_origen
            dep= Sip::Departamento.find(self.id_departamento)
            pais = Sip::Pais.find(dep.id_pais)
            self.nombre + " / " + dep.nombre + " / " + pais.nombre
          end


          def presenta_nombre
            if @@conf_presenta_nombre_con_departamento
              presenta_nombre_con_departamento
            elsif @@conf_presenta_nombre_con_origen
              presenta_nombre_con_origen
            else
              self.nombre
            end
          end

        end

      end
    end
  end
end

