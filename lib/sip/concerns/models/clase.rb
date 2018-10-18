# encoding: UTF-8

module Sip
  module Concerns
    module Models
      module Clase
        extend ActiveSupport::Concern

        include Sip::Basica
        included do
          Nombresunicos=false  # Por ejemplo hay departamento AMAZONAS en COLOMBIA y en VENEZUELA
          self.table_name = 'sip_clase'
          has_many :persona, foreign_key: "id_clase", validate: true,
            class_name: 'Sip::Persona'
          has_many :ubicacion, foreign_key: "id_clase", validate: true,
            class_name: 'Sip::Ubicacion'

          belongs_to :municipio, foreign_key: "id_municipio", 
            validate: true, class_name: 'Sip::Municipio'
          belongs_to :tclase, foreign_key: "id_tclase", validate: true,
            class_name: 'Sip::Tclase'

          validates :id_municipio, presence:true
          validates :id_tclase, presence:true, length: { maximum: 10 } 

          validates_uniqueness_of :id_clalocal, 
            scope: :id_municipio,
            message: "debe ser único en el municipio",
            allow_blank: true 

          validates_uniqueness_of :nombre, 
            scope: :id_municipio,
            case_sensitive: false, 
            message: "debe ser único en el municpio"

          @@conf_presenta_nombre_con_origen = false
          mattr_accessor :conf_presenta_nombre_con_origen

          def presenta_nombre_con_origen
            mun = Sip::Municipio.find(self.id_municipio)
            dep= Sip::Departamento.find(mun.id_departamento)
            pais = Sip::Pais.find(dep.id_pais)
            self.nombre + " / " + mun.nombre + "/" + dep.nombre + 
              " / " + pais.nombre
          end

          def presenta_nombre
            if @@conf_presenta_nombre_con_origen
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

