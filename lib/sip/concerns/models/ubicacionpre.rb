# encoding: UTF-8

module Sip
  module Concerns
    module Models
      module Ubicacionpre
        extend ActiveSupport::Concern
        
        included do
          self.table_name = 'sip_ubicacionpre'

          belongs_to :pais, class_name: "Sip::Pais",
            foreign_key: "pais_id", validate: true, optional: true
          belongs_to :departamento, class_name: "Sip::Departamento",
            foreign_key: "departamento_id", validate: true, optional: true
          belongs_to :municipio, class_name: "Sip::Municipio",
            foreign_key: "municipio_id", validate: true, optional: true
          belongs_to :clase, class_name: "Sip::Clase",
            foreign_key: "clase_id", validate: true, optional: true
          belongs_to :tsitio, class_name: "Sip::Tsitio",
            foreign_key: "clase_id", validate: true, optional: true

          validates :nombre, uniqueness: true, presence: true,
	    length: { maximum: 2000 }
          validates :lugar, length: { maximum: 500 } 
          validates :sitio, length: { maximum: 500 } 

        end
      end
    end
  end
end

