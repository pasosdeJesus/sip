
module Sip
  module Concerns
    module Models
      module OrgsocialSectororgsocial
        extend ActiveSupport::Concern

        included do
          self.table_name = 'sip_orgsocial_sectororgsocial'

          belongs_to :orgsocial, class_name: 'Sip::Orgsocial', 
            foreign_key: 'orgsocial_id'
          belongs_to :sectororgsocial, class_name: 'Sip::Sectororgsocial',
            foreign_key: 'sectororgsocial_id'

        end # included

      end
    end
  end
end
