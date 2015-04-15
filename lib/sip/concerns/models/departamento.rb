# encoding: UTF-8
module Sip
  module Concerns
    module Models
      module Etiqueta
        extend ActiveSupport::Concern

        include Sip::Basica
				included do
					has_many :clase, foreign_key: "id_departamento", validate: true, 
						class_name: 'Sip::Clase'
					has_many :municipio, foreign_key: "id_departamento", validate: true, 
						class_name: 'Sip::Municipio'
					has_many :persona, foreign_key: "id_departamento", validate: true, 
						class_name: 'Sip::Persona'
					has_many :ubicacion, foreign_key: "id_departamento", validate: true, 
						class_name: 'Sip::Ubicacion'

					belongs_to :pais, foreign_key: "id_pais", validate: true, 
						class_name: 'Sip::Pais'

					validates :id, presence: true  # Diseñados 
					validates :id_pais, presence: true
				end
			end
		end
  end
end

