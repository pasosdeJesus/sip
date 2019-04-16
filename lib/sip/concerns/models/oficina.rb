# encoding: UTF-8

module Sip
  module Concerns
    module Models
      module Oficina
        extend ActiveSupport::Concern

        include Sip::Basica
        included do
          self.table_name = 'sip_oficina'
	
	  validates :observaciones, length: { maximum:599  }
	
	end

      end
    end
  end
end

