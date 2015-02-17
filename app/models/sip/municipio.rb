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
    belongs_to :pais, foreign_key: "id_pais", validate: true, 
      class_name: 'Sip::Pais'

    validates :id, presence: true  # Diseñados
    validates :id_pais, presence: true
    validates :id_departamento, presence: true
  end
end
