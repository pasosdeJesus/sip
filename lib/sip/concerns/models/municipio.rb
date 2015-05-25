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
				end
			end
		end
  end
end

