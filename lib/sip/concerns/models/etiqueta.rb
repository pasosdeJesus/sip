# encoding: UTF-8

module Sip
  module Concerns
    module Models
      module Etiqueta
        extend ActiveSupport::Concern

        include Sip::Basica
        included do
          self.table_name = 'sip_etiqueta'
          validates :nombre, presence: true, allow_blank: false
          validates :fechacreacion, presence: true, allow_blank: false
          validates :observaciones, length: { maximum: 500 }
        end
      end
    end
  end
end

