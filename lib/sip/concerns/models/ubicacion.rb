# encoding: UTF-8

module Sip
  module Concerns
    module Models
      module Ubicacion
        extend ActiveSupport::Concern

        included do
          self.table_name = 'sip_ubicacion'
          belongs_to :pais, foreign_key: "id_pais", validate: true, 
            class_name: "Sip::Pais"
          belongs_to :departamento, foreign_key: "id_departamento", validate: true, 
            class_name: "Sip::Departamento" 
          belongs_to :municipio, foreign_key: "id_municipio", validate: true, 
            class_name: "Sip::Municipio"
          belongs_to :clase, foreign_key: "id_clase", validate: true, 
            class_name: "Sip::Clase" 
          belongs_to :tsitio, foreign_key: "id_tsitio", validate: true, 
            class_name: "Sip::Tsitio" 
            
          validates_presence_of :pais
          validates_presence_of :id_tsitio

          validates :lugar, length: { maximum: 500 } 
          validates :sitio, length: { maximum: 500 } 
        end
      end
    end
  end
end

