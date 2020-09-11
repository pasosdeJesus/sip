source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '>= 2.6.0'

gem 'bootsnap', '>= 1.4.2', require: false

gem 'cancancan'                 # Control de acceso

gem 'coffee-rails'              , '>= 5.0.0' # CoffeeScript para recursos .js.coffee 

gem 'devise'                    , '>= 4.7.2' # Autenticación

gem 'devise-i18n'               , '>= 1.9.2' # Localización e Internacionalización                  
gem 'jbuilder', '>= 2.7'        # Json

gem 'paperclip'                 # Anexos

gem 'pg', '>= 0.18', '< 2.0'    # PostgreSQL

gem 'puma'                      # Lanza en modo desarrollo

gem 'rails', '>= 6.0.3.3'

gem 'rails-i18n'                , '>= 6.0.0' # Localización e Internacionalización 

gem 'sassc-rails', '>= 2.1.2' #, '2.1.0'      # Conversión a CSS

gem 'simple_form'               , '>= 5.0.2' # Formularios

gem 'turbolinks', '~> 5'        # Acelera carga de paginas

gem 'twitter_cldr'              # Localiación e internacionalización 

gem 'tzinfo'                    # Zonas horarias

gem 'webpacker', '~> 4.3', '>= 4.3.0' # Traduce y compila modulos Javascript

gem 'will_paginate'             # Pagina listados


group :development, :test do
  #gem 'byebug'

  gem 'colorize'

  gem "spring" # Acelera ejecutando en fondo. https://github.com/jonleighton/spring
end

group :development do
  gem 'web-console', '>= 4.0.4'

end

group :test do

  gem "connection_pool"

  gem "minitest"

  gem "minitest-reporters"

  gem 'rails-controller-testing', '>= 1.0.5'

  gem 'selenium-webdriver'

  # Problemas con simplecov 0.18 que en travis genera:
  # Error: json: cannot unmarshal object into Go struct field input.coverage of type []formatters.NullInt
  # https://github.com/codeclimate/test-reporter/issues/418
  gem 'simplecov', '~> 0.10', '< 0.18'

  gem 'spork' # Un proceso para cada prueba -- acelera

  
  gem 'webdrivers'
end



