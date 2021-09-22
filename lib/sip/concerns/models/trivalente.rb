
module Sip
  module Concerns
    module Models
      module Trivalente
        extend ActiveSupport::Concern

        included do
          include Sip::Basica

          self.table_name = 'sip_trivalente'
        end # included


      end
    end
  end
end
