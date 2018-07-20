# encoding: UTF-8

module Sip
  module Concerns
    module Models
      module Sectoractor
        extend ActiveSupport::Concern

        included do
          include Sip::Modelo 
          include Sip::Localizacion
          include Sip::Basica

          self.table_name = 'sip_sectoractor'

        end

      end
    end
  end
end
