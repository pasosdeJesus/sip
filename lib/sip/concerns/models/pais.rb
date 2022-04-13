
module Sip
  module Concerns
    module Models
      module Pais
        extend ActiveSupport::Concern

        include Sip::Basica
        included do
          self.table_name = 'sip_pais'
          has_many :departamento, foreign_key: "id_pais", validate: true,
            class_name: 'Sip::Departamento' 
          has_one :personanacionalde, foreign_key: "nacionalde", 
            validate: true, class_name: "Sip::Persona"
          has_one :personapais, foreign_key: "id_pais", 
            class_name: "Sip::Persona"
          has_many :ubicacion, foreign_key: "id_pais", validate: true,
            class_name: 'Sip::Ubicacion' 

          validates :id, presence: true, uniqueness: true
          validates :nombreosm, presence: true, allow_blank: false, 
            length: { maximum: 200 }, 
            uniqueness: { case_sensitive: false, allow_blank: true}
          validates :nombre, presence: true, allow_blank: false, 
            length: { maximum: 200 },
            uniqueness: { case_sensitive: false, allow_blank: true}
          validates :alfa2, length: { maximum: 2 }, 
            uniqueness: { case_sensitive: false, allow_blank: true}
          validates :alfa3, length: { maximum: 3 },
            uniqueness: { case_sensitive: false, allow_blank: true}
          validates :div1, length: { maximum: 100 } 
          validates :div2, length: { maximum: 100 } 
          validates :div3, length: { maximum: 100 } 

          def nombreosm=(val)
            self[:nombreosm] = val.upcase.squish if val
          end

        end

      end
    end
  end
end

