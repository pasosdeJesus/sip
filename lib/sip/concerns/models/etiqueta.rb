# encoding: UTF-8

module Sip
  module Concerns
    module Models
      module Etiqueta
        extend ActiveSupport::Concern

        include Sip::Basica
        included do
          self.table_name = 'sip_etiqueta'


          has_and_belongs_to_many :municipio, 
            class_name: 'Sip::Municipio',
            foreign_key: 'etiqueta_id',
            association_foreign_key: 'municipio_id',
            join_table: 'sip_etiqueta_municipio'

          validates :nombre, presence: true, allow_blank: false
          validates :fechacreacion, presence: true, allow_blank: false
          validates :observaciones, length: { maximum: 500 }
        end
      end
    end
  end
end

