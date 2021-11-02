ENV["BUNDLE_GEMFILE"] ||= File.expand_path("../../../Gemfile", __dir__)

require "bundler/setup" # Configurar gemas listadas en Gemfile
require "bootsnap/setup" # Acelerar tiempo de arranque dejando en colchón operaciones costosas
$LOAD_PATH.unshift File.expand_path('../../../../lib', __FILE__)
