require 'sip/version'

Sip.setup do |config|
      config.ruta_anexos = (ENV['SIP_RUTA_ANEXOS'] || 
                            "#{Rails.root}/archivos/anexos")
      config.ruta_volcados = (ENV['SIP_RUTA_VOLCADOS'] || 
                              "#{Rails.root}/archivos/bd")
      config.titulo = "sip " + Sip::VERSION
      config.longitud_nusuario = 10
end
