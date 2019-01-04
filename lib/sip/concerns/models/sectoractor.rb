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

          has_and_belongs_to_many :actorsocial,
            class_name: 'Sip::Actorsocial',
            foreign_key: 'sectoractor_id',
            validate: true,
            association_foreign_key: "actorsocial_id",
            join_table: 'sip_actorsocial_sectoractor'

        end

      end
    end
  end
end
