module Sip
  module Concerns
    module Models
      module Estadosol
        extend ActiveSupport::Concern

        include Sip::Basica

        included do
          self.table_name = 'sip_estadosol'

          PENDIENTE = 1
          RESUELTO = 2
        end
      end
    end
  end
end
