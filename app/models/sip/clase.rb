# encoding: UTF-8
module Sip
  class Clase < ActiveRecord::Base
    include Basica

    has_many :persona, foreign_key: "id_clase", validate: true,
      class_name: 'Sip::Persona'
    has_many :ubicacion, foreign_key: "id_clase", validate: true,
      class_name: 'Sip::Ubicacion'

    belongs_to :municipio, foreign_key: "id_municipio", 
      validate: true, class_name: 'Sip::Municipio'
    belongs_to :tclase, foreign_key: "id_tclase", validate: true,
      class_name: 'Sip::Tclase'

    validates :id, presence: true  # Diseñados 
    validates :id_municipio, presence:true
  end
end
