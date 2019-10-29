# encoding: UTF-8

require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

require 'sip'

module Dummy
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    config.time_zone = 'America/Bogota'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    config.i18n.default_locale = :es

    # En el momento soporta 3: yyyy-mm-dd, dd-mm-yyyy y dd/M/yyyy
    config.x.formato_fecha = 'dd/M/yyyy'

    config.colorize_logging = true

    config.active_record.schema_format = :sql

    config.hosts << ENV['CONFIG_HOSTS'] || '127.0.0.1'

    #config.web_console.whitelisted_ips = ['186.154.35.237']
   

  end
end
