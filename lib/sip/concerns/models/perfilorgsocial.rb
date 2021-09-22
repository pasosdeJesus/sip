
module Sip
  module Concerns
    module Models
      module Perfilorgsocial
        extend ActiveSupport::Concern

        included do
          include Sip::Modelo 
          include Sip::Localizacion
          include Sip::Basica

          self.table_name = 'sip_perfilorgsocial'

        end # included

      end
    end
  end
end
