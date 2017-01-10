require 'sip/version'

Sip.setup do |config|
      config.ruta_anexos = "#{Rails.root}/archivos/anexos"
      config.ruta_volcados = "#{Rails.root}/archivos/bd"
      config.titulo = "sip " + Sip::VERSION
end
