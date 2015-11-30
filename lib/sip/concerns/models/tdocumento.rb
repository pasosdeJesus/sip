# encoding: UTF-8

module Sip
  module Concerns
    module Models
      module Tdocumento
        extend ActiveSupport::Concern

        include Sip::Basica
        included do
          self.table_name = 'sip_tdocumento'
          validates :sigla, length: { maximum: 100 }
          validates :formatoregex, length: { maximum: 500 }
        end

      end
    end
  end
end

