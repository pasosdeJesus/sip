# encoding: UTF-8

module Sip
  module Concerns
    module Models
      module Sectororgsocial
        extend ActiveSupport::Concern

        included do
          include Sip::Modelo 
          include Sip::Localizacion
          include Sip::Basica

          self.table_name = 'sip_sectororgsocial'

          has_and_belongs_to_many :orgsocial,
            class_name: 'Sip::Orgsocial',
            foreign_key: 'sectororgsocial_id',
            validate: true,
            association_foreign_key: "orgsocial_id",
            join_table: 'sip_orgsocial_sectororgsocial'

        end

      end
    end
  end
end
