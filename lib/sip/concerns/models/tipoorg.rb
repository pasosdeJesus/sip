module Sip
  module Concerns
    module Models
      module Tipoorg
        extend ActiveSupport::Concern

        include Sip::Basica
        included do
          ORGACOMP   = 1
          ORGNOACOMP = 2
          ORGCIVIL   = 2
          INSTCIVIL  = 3  # Institución Civil
          ESTADO     = 3
          #ORGFP = 4     # Fuerza pública es parte de estado
          ORGINT     = 5 # Organismo internacional
          GRUPOARMADO   = 20 # Que no es estatal

          has_many :orgsocial, foreign_key: 'tipoorg_id', validate: true,
            class_name: 'Sip::Orgsocial'

        end # included

      end
    end
  end
end
