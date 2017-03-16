source 'https://rubygems.org'

gem 'puma', '~> 3.0'

# Rails (internacionalización)
gem "rails", '~> 5.0.0'
gem "rails-i18n"

# Postgresql
gem "pg"

# Colores en terminal
gem "colorize"

# Unifica CSSs
gem "sass"
gem "sass-rails"

# API JSON facil. Ver: https://github.com/rails/jbuilder
gem "jbuilder"

# Incluida para asegurar operacion con ruby 2.4
#gem 'json', '~>2.0.0'

# Uglifier comprime recursos Javascript
gem "uglifier"#, '>= 1.3.0'

# CoffeeScript para recuersos .js.coffee y vistas
gem "coffee-rails"

# jquery como librería JavaScript
gem "jquery-rails"
gem "jquery-ui-rails"
#gem "jquery-ui-bootstrap-rails", git: "https://github.com/kristianmandrup/jquery-ui-bootstrap-rails"

# Seguir enlaces más rápido. Ver: https://github.com/rails/turbolinks
gem "turbolinks"#, "2.5.3"

# Ambiente de CSS
gem "twitter-bootstrap-rails"#, '~> 3.2.0'
gem "font-awesome-rails"
gem "bootstrap-datepicker-rails"

# Formularios simples 
gem "simple_form"

# Autenticación y roles
gem "devise"
gem "devise-i18n"
gem "cancancan"
gem "bcrypt"

# Pagina listados
gem "will_paginate"

# ICU con CLDR
gem 'twitter_cldr'
 
# Maneja adjuntos
gem "paperclip"#, "~> 4.1"

# Zonas horarias
gem "tzinfo"
gem "tzinfo-data"

group :doc do
  # Genera documentación en doc/api con bundle exec rake doc:rails
  #gem "sdoc", require: false
end

# Los siguientes son para desarrollo o para pruebas con generadores
group :development do
  # Requerido por rake
  gem "thor"

  # Depurar
  #gem 'byebug'
  
  # Consola irb en páginas con excepciones o usando <%= console %> en vistasA
  gem 'web-console'

end

# Los siguientes son para pruebas y no tiene generadores requeridos en desarrollo
group :test do
  gem 'simplecov'
  # Envia resultados de pruebas desde travis a codeclimate
  gem "codeclimate-test-reporter"

  gem "connection_pool"
  gem "minitest-reporters"

  #gem 'byebug'

  gem 'rails-controller-testing'

  # Acelera ejecutando en fondo. https://github.com/jonleighton/spring
  gem "spring"
  
  # Un proceso para cada prueba -- acelera
  gem 'spork'#, '~> 1.0rc'

  # Maneja datos de prueba
  gem "factory_girl_rails", group: [:development, :test]#, "~> 4.0"

  # https://www.relishapp.com/womply/rails-style-guide/docs/developing-rails-applications/bundler
  # Lanza programas para examinar resultados
  gem "launchy"
 
  gem 'pry-rescue'
  #gem 'pry-byebug'
  gem 'pry-stack_explorer'


end

