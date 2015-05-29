# encoding: UTF-8

module Sip
  module Basica
    extend ActiveSupport::Concern

    included do
      scope :habilitados, -> (campoord = "nombre") {
        where(fechadeshabilitacion: nil).order(campoord.to_sym)
      }
      validates :nombre, presence: true, allow_blank: false, 
        length: { maximum: 500 } 
      validates :observaciones, length: { maximum: 5000 }
      validates :fechacreacion, presence: true, allow_blank: false

      # Para presentar en index y show
      def presenta(atr)
        if self.class.columns_hash && self.class.columns_hash[atr] && 
          self.class.columns_hash[atr].type == :boolean 
          self[atr] ? "Si" : "No" 
        elsif atr.to_s.ends_with? "_ids"
          "map"
        elsif atr.to_s.ends_with? "_id"
          "ref"
        else
          self[atr.to_s].to_s
        end
      end

      # Para búsquedas tipo autocompletacion en base de datos campos a observar
      def self.busca_etiqueta_campos
        ['nombre']
      end

      # Para búsquedas tipo autocompletacion etiqueta que se retorna
      def busca_etiqueta
        v = self.class.busca_etiqueta_campos.map { |c|
          self[c]
        }
        return v.join(" ")
      end

      # Para búsquedas tipo autocompletacion valor que se retorna
      def busca_valor
        self['id']
      end
    end


  end
end
