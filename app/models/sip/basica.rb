# encoding: UTF-8

module Sip
  module Basica
    extend ActiveSupport::Concern

    included do
      scope :habilitados, -> (campoord = "nombre") {
        where(fechadeshabilitacion: nil).order(campoord.to_sym)
      }
      validates :nombre, presence: true, allow_blank: false
      validates :fechacreacion, presence: true, allow_blank: false
    end

  end
end
