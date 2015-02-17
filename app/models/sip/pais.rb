# encoding: UTF-8
module Sip
  class Pais < ActiveRecord::Base
    include Basica

    has_many :clase, foreign_key: "id_pais", validate: true,
      class_name: 'Sip::Clase' 
    has_many :municipio, foreign_key: "id_pais", validate: true,
      class_name: 'Sip::Municipio' 
    has_many :departamento, foreign_key: "id_pais", validate: true,
      class_name: 'Sip::Departamento' 
    has_one :personanacionalde, foreign_key: "nacionalde", validate: true,
        class_name: "Sip::Persona"
    has_many :persona, foreign_key: "id_pais", validate: true,
      class_name: 'Sip::Victima' 
    has_many :ubicacion, foreign_key: "id_pais", validate: true,
      class_name: 'Sip::Ubicacion' 

    validates :id, presence: true  # Diseñados 
    validates :nombreiso, presence: true, allow_blank: false
  end
end
