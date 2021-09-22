
module Sip
  module Concerns
    module Models
      module Tema
        extend ActiveSupport::Concern

        included do

          include Sip::Basica
          self.table_name = 'sip_tema'

        end
      end
    end
  end
end
