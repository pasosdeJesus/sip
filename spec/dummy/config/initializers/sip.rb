require 'sip/version'

Sip.setup do |config|
      config.ruta_anexos = "#{Rails.root}/archivos/"
      config.ruta_volcados = "#{Rails.root}/archivos/bd"
      config.dir_respaldo7z = "respaldo7z"
      config.titulo = "sip " + Sip::VERSION
end
