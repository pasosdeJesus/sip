# encoding: UTF-8

module Sip
  module Concerns
    module Models
      module Tdocumento
        extend ActiveSupport::Concern

        include Sip::Basica
        included do

          validates :sigla, length: { maximum: 100 }
          validates :formatoregex, length: { maximum: 500 }
        end

      end
    end
  end
end

