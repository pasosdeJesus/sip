module Sip
  class Respaldo7z
    include ActiveModel::Model

    attr_accessor :clave7z

    validates :clave7z, presence: true, confirmation: true, format: { 
      with: /\A[-A-Za-z0-9{}*.,:;+@^~<>#_!$%&()=?]*\z/, 
      message: 'sólo letras, dígitos y los siguientes caracteres especiales -{}*.,:;+@^~<>#_!$%&()=?'
    }
    validates :clave7z_confirmation, presence: true

    validate :existe_7z
    def existe_7z
      if Sip::TareasrakeHelper.which('7z').nil?
        errors[:base] << 'No se encontró el programa 7z en el servidor'
      end
    end

  end
end
