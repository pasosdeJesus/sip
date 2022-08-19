
module Sip
  module Concerns
    module Models
      module Ubicacion
        extend ActiveSupport::Concern

        included do

          include Sip::Modelo

          self.table_name = 'sip_ubicacion'
          belongs_to :pais, foreign_key: "id_pais", validate: true, 
            class_name: "Sip::Pais", optional: false
          belongs_to :departamento, foreign_key: "id_departamento", 
            validate: true, class_name: "Sip::Departamento", optional: true
          belongs_to :municipio, foreign_key: "id_municipio", validate: true, 
            class_name: "Sip::Municipio", optional: true
          belongs_to :clase, foreign_key: "id_clase", validate: true, 
            class_name: "Sip::Clase" , optional: true
          belongs_to :tsitio, foreign_key: "id_tsitio", validate: true, 
            class_name: "Sip::Tsitio", optional: true 

          validates_presence_of :pais
          validates_presence_of :id_tsitio

          validates :lugar, length: { maximum: 500 } 
          validates :sitio, length: { maximum: 500 } 

          def presenta_nombre(opciones = {}) 
            sep = ''
            r = ''
            if opciones[:sin_pais].nil? && self.pais
              r = self.pais.nombre 
              sep = ' / '
            end
            if opciones[:sin_departamento].nil? && self.departamento
              r += sep + self.departamento.nombre 
              sep = ' / '
            end
            if opciones[:sin_municipio].nil? && self.municipio
              r += sep + self.municipio.nombre 
              sep = ' / '
            end
            if opciones[:sin_clase].nil? && self.clase
              r += sep + self.clase.nombre 
              sep = ' / '
            end
            r
          end

        end
      end
    end
  end
end

