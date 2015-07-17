# encoding: UTF-8

module Sip
  module Concerns
    module Models
      module Pais
        extend ActiveSupport::Concern

        include Sip::Basica
        included do

          has_many :departamento, foreign_key: "id_pais", validate: true,
            class_name: 'Sip::Departamento' 
          has_one :personanacionalde, foreign_key: "nacionalde", validate: true,
            class_name: "Sip::Persona"
          has_many :persona, foreign_key: "id_pais", validate: true,
            class_name: 'Sip::Victima' 
          has_many :ubicacion, foreign_key: "id_pais", validate: true,
            class_name: 'Sip::Ubicacion' 

          validates :id, presence: true, uniqueness: true
          validates :nombreiso, presence: true, allow_blank: false, 
            length: { maximum: 200 } 
          validates :nombre, presence: true, allow_blank: false, 
            length: { maximum: 200 } 
          validates :alfa2, length: { maximum: 2 } 
          validates :alfa3, length: { maximum: 3 } 
          validates :div1, length: { maximum: 100 } 
          validates :div2, length: { maximum: 100 } 
          validates :div3, length: { maximum: 100 } 
        end

      end
    end
  end
end

