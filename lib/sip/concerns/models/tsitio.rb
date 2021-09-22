
module Sip
  module Concerns
    module Models
      module Tsitio
        extend ActiveSupport::Concern

        include Sip::Basica
        included do
          self.table_name = 'sip_tsitio'
          has_many :ubicacion, foreign_key: "id_tsitio", validate: true,
            class_name: 'Sip::Ubicacion'
        end
      end
    end
  end
end

