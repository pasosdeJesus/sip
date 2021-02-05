Dummy::Application.config.relative_url_root = ENV.fetch(
  'RUTA_RELATIVA', '/sip')
Dummy::Application.config.assets.prefix = ENV.fetch(
  'RUTA_RELATIVA', '/sip') + '/assets'
