module Sip
  module Concerns
    module Models
      module Vereda
        extend ActiveSupport::Concern

        include Sip::Basica
        included do
          Nombresunicos=false  # Por ejemplo hay vereda SAN ANTONIO en 146 municipios
          self.table_name = 'sip_vereda'

          belongs_to :municipio, foreign_key: "municipio_id", 
            validate: true, class_name: 'Sip::Municipio', optional: false
          has_one :departamento, through: :municipio,
            class_name: 'Sip::Departamento', source: :departamento
          has_one :pais, through: :departamento,
            class_name: 'Sip::Pais', source: :pais

          validates :municipio_id, presence:true

          validates_uniqueness_of :verlocal_id, 
            scope: :municipio_id,
            message: "debe ser único en el municipio",
            allow_blank: true 

#          validates_uniqueness_of :nombre, 
#            scope: :municipio_id,
#            case_sensitive: false, 
#            message: "debe ser único en el municpio"

          scope :filtro_pais, lambda {|p|
            joins(:municipio).joins(:departamento).
              where('sip_departamento.id_pais=?', p)
          }

          @@conf_presenta_nombre_con_origen = false
          mattr_accessor :conf_presenta_nombre_con_origen

          def presenta_nombre_con_origen
            mun = Sip::Municipio.find(self.municipio_id)
            dep= Sip::Departamento.find(mun.id_departamento)
            pais = Sip::Pais.find(dep.id_pais)
            "VEREDA: " + self.nombre + " / " + mun.nombre + "/" + dep.nombre + 
              " / " + pais.nombre
          end

          def presenta_nombre
            if @@conf_presenta_nombre_con_origen
              presenta_nombre_con_origen
            else
              self.nombre
            end
          end

        end

      end
    end
  end
end

