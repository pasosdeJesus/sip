# encoding: UTF-8

module Sip
  module Concerns
    module Models
      module Etiqueta
        extend ActiveSupport::Concern

        include Sip::Basica
        included do
          validates :nombre, presence: true, allow_blank: false
          validates :fechacreacion, presence: true, allow_blank: false
        end
      end
    end
  end
end

