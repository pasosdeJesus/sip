Sip::Application.config.relative_url_root = ENV.fetch(
  'RUTA_RELATIVA', '/sip')
Sip::Application.config.assets.prefix = ENV.fetch(
  'RUTA_RELATIVA', '/sip') + '/assets'
