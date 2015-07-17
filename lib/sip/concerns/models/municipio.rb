# encoding: UTF-8

module Sip
  module Concerns
    module Models
      module Municipio
        extend ActiveSupport::Concern

        include Sip::Basica
        included do

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

          def presenta_nombre
            dep= Sip::Departamento.find(self.id_departamento)
            pais = Sip::Pais.find(dep.id_pais)
            self.nombre + " / " + dep.nombre + " / " + pais.nombre
          end
        end

      end
    end
  end
end

