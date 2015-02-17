$:.push File.expand_path("../lib", __FILE__)
# encoding: UTF-8

# Maintain your gem's version:
require "sip/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "sip"
  s.version     = Sip::VERSION
  s.authors     = ["Vladimir Támara Patiño"]
  s.email       = ["vtamara@pasosdeJesus.org"]
  s.homepage    = "http://github.com/pasosdeJesus/sip.git"
  s.summary     = "Motor para Sistemas de Información estilo Pasos de Jesús"
  s.description = "Motor para construir su propio sistema de información."
  s.license     = "Dominio Público de acuerdo a legislación colombiana"

  s.files = Dir["{app,config,db,lib}/**/*", "LICENCIA.md", "Rakefile", "README.md"]
  s.test_files = Dir["spec/**/*"]

  s.add_dependency "jquery-rails"

  s.add_runtime_dependency "rails"
  s.add_runtime_dependency "devise"

  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "capybara"
  s.add_development_dependency "factory_girl_rails"

end
