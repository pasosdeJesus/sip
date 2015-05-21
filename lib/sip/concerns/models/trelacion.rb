# encoding: UTF-8

module Sip
  module Concerns
    module Models
      module Trelacion
        extend ActiveSupport::Concern

        include Sip::Basica
        included do
          has_many :persona_trelacion, foreign_key: "id_trelacion", 
            validate: true, class_name: 'Sip::PersonaTrelacion'

          validates :id, presence: true, allow_blank: false, 
            length: { maximum: 2} 
          validates :inverso, presence: true, allow_blank: false, 
            length: { maximum: 2} 
          validates :observaciones, length: { maximum: 200}
          validates_uniqueness_of :id, case_sensitive: false
        end
      end
    end
  end
end

