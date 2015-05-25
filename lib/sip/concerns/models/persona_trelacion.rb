# encoding: UTF-8

module Sip
  module Concerns
    module Models
      module PersonaTrelacion
        extend ActiveSupport::Concern
        included do

          belongs_to :persona, foreign_key: "persona1", validate: true, 
            class_name: 'Sip::Persona'
          belongs_to :persona, foreign_key: "persona2", validate: true, 
            class_name: 'Sip::Persona'
          belongs_to :trelacion, foreign_key: "id_trelacion", validate: true, 
            class_name: 'Sip::Trelacion'

          validates :observaciones, length: { maximum: 200 }
        end
      end
    end
  end
end

