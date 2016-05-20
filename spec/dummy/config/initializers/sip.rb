require 'sip/version'

Sip.setup do |config|
      config.ruta_anexos = "#{Rails.root}/tmp/"
      config.ruta_volcados = "#{Rails.root}/tmp/"
      config.titulo = "sip " + Sip::VERSION
end
