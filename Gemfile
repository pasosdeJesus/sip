source 'https://rubygems.org'

# Servidor web durante desarrollo
gem 'puma', '~> 3.11'

# Rails (internacionalización)
gem "rails", '~> 5.2.1'
gem "rails-i18n"

gem 'bigdecimal'

# Postgresql
gem "pg"#, '~> 0.21'

# Colores en terminal
gem "colorize"

# Cuadros de selección potenciados
gem 'chosen-rails', git: "https://github.com/vtamara/chosen-rails.git", branch: 'app-assets'

# Unifica CSSs
gem "sass"
gem "sass-rails"

# API JSON facil. Ver: https://github.com/rails/jbuilder
gem "jbuilder"

# Arranque rapido
gem 'bootsnap', '>=1.1.0', require: false

# Uglifier comprime recursos Javascript
gem "uglifier"#, '>= 1.3.0'

# CoffeeScript para recuersos .js.coffee y vistas
gem "coffee-rails"

gem "rubyzip",'~> 1.2.2'

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
  gem 'byebug'
end

# Los siguientes son para pruebas y no tiene generadores requeridos en desarrollo
group :test do
  gem "minitest"
  gem 'simplecov'

  gem "connection_pool"
  gem "minitest-reporters"

  gem 'rails-controller-testing'

  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'chromedriver-helper'
  # Acelera ejecutando en fondo. https://github.com/jonleighton/spring
  gem "spring"
  
  # Un proceso para cada prueba -- acelera
  gem 'spork'#, '~> 1.0rc'

  # https://www.relishapp.com/womply/rails-style-guide/docs/developing-rails-applications/bundler
  # Lanza programas para examinar resultados
  gem "launchy"
 
  gem 'pry-rescue'
  gem 'pry-stack_explorer'


end

