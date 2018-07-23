# encoding: UTF-8

module Sip
  module Concerns
    module Models
      module Grupoper
        extend ActiveSupport::Concern

        included do
          self.table_name = 'sip_grupoper'

          validates :nombre, presence: true, allow_blank: false, 
            length: { maximum: 500 }
          validates :anotaciones, length: { maximum: 500 }


          def presenta_nombre
            self.nombre
          end

        end

      end
    end
  end
end

