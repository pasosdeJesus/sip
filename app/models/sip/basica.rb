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
    end


  end
end
