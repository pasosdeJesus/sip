
module Sip
  module Concerns
    module Models
      module Fuenteprensa
        extend ActiveSupport::Concern
        include Sip::Basica
        included do
          self.table_name = 'sip_fuenteprensa'
        end
      end
    end
  end
end

