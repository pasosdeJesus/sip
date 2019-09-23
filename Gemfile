source 'https://rubygems.org'

# Librería fundamental
########################

# Rails (internacionalización)
gem "rails", '~> 6.0.0.rc1'
gem "rails-i18n"

# Arranque rapido
gem 'bootsnap', '>=1.1.0', require: false


# Al lado del servidor
########################

# Postgresql
gem "pg"#, '~> 0.21'

# API JSON facil. Ver: https://github.com/rails/jbuilder
gem "jbuilder"

gem "rubyzip", '~> 1.2.2'

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

# Formularios simples 
gem "simple_form"

# Desarrollo y despliegue
########################

# Colores en terminal
gem "colorize"

# Servidor web durante desarrollo
gem 'puma'

group :doc do
  # Genera documentación en doc/api con bundle exec rake doc:rails
  #gem "sdoc", require: false
end

# Los siguientes son para desarrollo o para pruebas con generadores
group :development do
  # Requerido por rake
  gem "thor"

  # Para generar modelo entidad asociación 
  gem 'rails-erd'

  # Consola irb en páginas con excepciones o usando <%= console %> en vistasA
  gem 'web-console'
end

group :development, :test do
  # Depurar
  #gem 'byebug'
end

# Los siguientes son para pruebas y no tiene generadores requeridos en desarrollo
group :test do
  gem "minitest"
  gem "connection_pool"
  gem "minitest-reporters"
  gem 'rails-controller-testing'

  # Cobertura de pruebas
  gem 'simplecov'

  # Pruebas al sistema
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'chromedriver-helper'

  # Acelera ejecutando en fondo. https://github.com/jonleighton/spring
  gem "spring"
  
  # Un proceso para cada prueba -- acelera
  gem 'spork'#, '~> 1.0rc'
end


# Al lado del cliente
########################

# Módulos en Javascript  https://github.com/rails/webpacker
gem 'webpacker'

# Seguir enlaces más rápido. Ver: https://github.com/rails/turbolinks
gem "turbolinks"#, "2.5.3"

# CoffeeScript para recursos .js.coffee y vistas
gem "coffee-rails"

gem "jquery-rails"

gem "jquery-ui-rails"

# Uglifier comprime recursos Javascript
gem "uglifier"#, '>= 1.3.0'

# Unifica CSSs
gem "sassc"
gem "sassc-rails"

# bootstrap ahora por webpack

# Ambiente de CSS
gem "font-awesome-rails"

# Cuadros de selección potenciados
gem 'chosen-rails', git: "https://github.com/vtamara/chosen-rails.git", branch: 'several-fixes'

gem 'pick-a-color-rails'

gem 'tiny-color-rails'


