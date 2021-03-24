source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

#ruby '>= 2.7.1'

gem 'bootsnap', '>= 1.4.2', require: false

gem 'cancancan'                 # Control de acceso

gem 'coffee-rails'              # CoffeeScript para recursos .js.coffee

gem 'devise'                    # Autenticación

gem 'devise-i18n'               # Localización e Internacionalización

gem 'jbuilder', '>= 2.7'        # Json

gem 'nokogiri', '>=1.11.1'

gem 'kt-paperclip',                 # Anexos
  git: 'https://github.com/kreeti/kt-paperclip.git'
  #git: 'https://github.com/vtamara/paperclip.git', branch: 'fix-ruby3'
  #path: '../tmp/paperclip'

gem 'pg', '>= 0.18', '< 2.0'    # PostgreSQL

gem 'puma'                      # Lanza en modo desarrollo

gem 'rails', '~> 6.1'
  #git: 'https://github.com/rails/rails.git', branch: '6-1-stable'

gem 'rails-i18n'                # Localización e Internacionalización

gem 'sassc-rails'#, '2.1.0'      # Conversión a CSS

gem 'simple_form'               # Formularios

gem 'turbolinks', '~> 5'        # Acelera carga de paginas

gem 'twitter_cldr'              # Localiación e internacionalización

gem 'tzinfo'                    # Zonas horarias

gem 'webpacker', '~> 4.0'       # Traduce y compila modulos Javascript

gem 'will_paginate'             # Pagina listados


group :development, :test do
  #gem 'byebug'

  gem 'colorize'

  gem 'dotenv-rails'

  gem 'rails-erd'

  #gem "spring" # Acelera ejecutando en fondo. https://github.com/jonleighton/spring
end

group :development do
  gem 'web-console', '>= 3.3.0'

end

group :test do

  gem "connection_pool"

  gem "minitest"

  gem "minitest-reporters"

  gem 'rails-controller-testing'

  gem 'selenium-webdriver'

  # Problemas con simplecov 0.18 que en travis genera:
  # Error: json: cannot unmarshal object into Go struct field input.coverage of type []formatters.NullInt
  # https://github.com/codeclimate/test-reporter/issues/418
  gem 'simplecov', '~> 0.10', '< 0.18'

  gem 'spork' # Un proceso para cada prueba -- acelera

  gem 'webdrivers'
end



