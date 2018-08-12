# encoding: UTF-8

module Sip
  module Concerns
    module Models
      module ActorsocialSectoractor
        extend ActiveSupport::Concern

        included do
          self.table_name = 'sip_actorsocial_sectoractor'

          belongs_to :actorsocial, class_name: 'Sip::Actorsocial', 
            foreign_key: 'actorsocial_id'
          belongs_to :sectoractor, class_name: 'Sip::Sectoractor',
            foreign_key: 'sectoractor_id'

        end # included

      end
    end
  end
end
