# encoding: UTF-8
module Sip
  class Municipio < ActiveRecord::Base
    include Basica

    has_many :clase, foreign_key: "id_municipio", validate: true, 
      class_name: 'Sip::Clase'
    has_many :persona, foreign_key: "id_municipio", validate: true, 
      class_name: 'Sip::Persona'
    has_many :ubicacion, foreign_key: "id_municipio", validate: true, 
      class_name: 'Sip::Ubicacion'

    belongs_to :departamento, foreign_key: "id_departamento", validate: true, 
      class_name: 'Sip::Departamento'

    validates :id, presence: true  # Diseñados
    validates :id_departamento, presence: true
  end
end
