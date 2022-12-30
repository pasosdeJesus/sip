source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }
git_source(:gitlab) { |repo| "https://gitlab.com/#{repo}.git" }

gemspec

gem "babel-transpiler"

gem "bootsnap", ">= 1.4.4", require: false

gem "cancancan"                 # Control de acceso

gem "cocoon", git: "https://github.com/vtamara/cocoon.git", branch: "new_id_with_ajax" # Formularios anidados (algunos con ajax)

gem "coffee-rails"              # CoffeeScript para recursos .js.coffee

gem "devise"                    # Autenticación

gem "devise-i18n"               # Localización e Internacionalización

gem "jbuilder", ">= 2.7"        # Json

gem "jsbundling-rails"

gem "kt-paperclip",                 # Anexos
  git: "https://github.com/kreeti/kt-paperclip.git"
  #git: "https://github.com/vtamara/paperclip.git", branch: "fix-ruby3"
  #path: "../tmp/paperclip"

gem "nokogiri", ">=1.11.1"


gem "pg", ">= 0.18", "< 2.0"    # PostgreSQL

gem "puma"                      # Lanza en modo desarrollo

gem "rails", "~> 7.0"
  #git: "https://github.com/rails/rails.git", branch: "6-1-stable"

gem "rails-i18n"                # Localización e Internacionalización

gem "redis"

gem "sassc-rails"#, "2.1.0"      # Conversión a CSS

gem "simple_form"               # Formularios

gem "sprockets-rails"

gem "stimulus-rails"               # Formularios

gem "turbo-rails", "~> 1.0"

gem "twitter_cldr"              # Localiación e internacionalización

gem "tzinfo"                    # Zonas horarias

gem "will_paginate"             # Pagina listados


group :development, :test do
  gem "brakeman"

  gem "bundler-audit"

  gem "code-scanning-rubocop"

  gem "colorize"

  gem "debug", ">= 1.0.0", platforms: %i[ mri mingw x64_mingw ]

  gem "dotenv-rails"

  gem "rails-erd"

  gem "rubocop-minitest"

  gem "rubocop-rails"

  gem "rubocop-shopify"
end

group :development do
  gem "web-console", ">= 3.3.0"
end

group :test do
  gem "capybara"

  gem "connection_pool"

  gem "cuprite"

  gem "minitest"

  gem "minitest-reporters"

  gem "rails-controller-testing"

  # Problemas con simplecov 0.18 que en travis genera:
  # Error: json: cannot unmarshal object into Go struct field input.coverage of type []formatters.NullInt
  # https://github.com/codeclimate/test-reporter/issues/418
  gem "simplecov"#, "~> 0.10", "< 0.18"

  gem "spork" # Un proceso para cada prueba -- acelera
end



