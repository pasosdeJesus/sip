# encoding: UTF-8

module Sip
  module Concerns
    module Models
      module Clase
        extend ActiveSupport::Concern

        include Sip::Basica
        included do

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

          validates :id, presence: true, uniqueness: true
        end

      end
    end
  end
end

