require 'devise'

module Sip
  class Engine < ::Rails::Engine

    isolate_namespace Sip

    config.generators do |g|
      g.test_framework      :rspec,        :fixture => false
      g.fixture_replacement :factory_girl, :dir => 'spec/factories'
      g.assets false
      g.helper false
    end

    # Basado en 
    # http://pivotallabs.com/leave-your-migrations-in-your-rails-engines/
    initializer :append_migrations do |app|
      unless app.root.to_s == root.to_s
        config.paths["db/migrate"].expanded.each do |expanded_path|
          app.config.paths["db/migrate"] << expanded_path
        end
      end
    end

    # De http://guides.rubyonrails.org/engines.html
    config.to_prepare do
#      Dir.glob(Engine.root + "app/decorators/**/*_decorator*.rb").each do |c|
#        require_dependency(c)
#      end
      Dir.glob(Rails.root + "app/decorators/**/*_decorator*.rb").each do |c|
        require_dependency(c)
      end
    end

  end

  class << self
    mattr_accessor :ruta_anexos
    mattr_accessor :ruta_volcados
    mattr_accessor :titulo
    mattr_accessor :longitud_nusuario
    mattr_accessor :paisomision
    mattr_accessor :colorom_nav_ini
    mattr_accessor :colorom_nav_fin
    mattr_accessor :colorom_nav_fuente
    mattr_accessor :colorom_fondo_lista
    mattr_accessor :colorom_btn_primario_fondo_ini
    mattr_accessor :colorom_btn_primario_fondo_fin
    mattr_accessor :colorom_btn_primario_fuente
    mattr_accessor :colorom_btn_peligro_fondo_ini
    mattr_accessor :colorom_btn_peligro_fondo_fin
    mattr_accessor :colorom_btn_peligro_fuente
    mattr_accessor :colorom_btn_accion_fondo_ini
    mattr_accessor :colorom_btn_accion_fondo_fin
    mattr_accessor :colorom_btn_accion_fuente
    mattr_accessor :colorom_alerta_exito_fondo
    mattr_accessor :colorom_alerta_exito_fuente
    mattr_accessor :colorom_alerta_problema_fondo
    mattr_accessor :colorom_alerta_problema_fuente
    mattr_accessor :colorom_fondo
    mattr_accessor :colorom_color_fuente


    self.ruta_anexos = "#{Rails.root}/archivos/anexos"
    self.ruta_volcados = "#{Rails.root}/archivos/bd"
    self.titulo = "Motor para Sistemas de Información estilo Pasos de Jesús" 
    self.longitud_nusuario = 15
    self.paisomision = 170
    self.colorom_fondo = '#ffffff'
    self.colorom_color_fuente = '#000000'
    self.colorom_nav_ini = '#266dd3'
    self.colorom_nav_fin = '#266dd3'
    self.colorom_nav_fuente = '#ffffff'
    self.colorom_fondo_lista = '#95c4ff'
    self.colorom_btn_primario_fondo_ini = '#0088cc'
    self.colorom_btn_primario_fondo_fin = '#0044cc'
    self.colorom_btn_primario_fuente = '#ffffff'
    self.colorom_btn_peligro_fondo_ini = '#ee5f5b'
    self.colorom_btn_peligro_fondo_fin = '#bd362f'
    self.colorom_btn_peligro_fuente = '#ffffff'
    self.colorom_btn_accion_fondo_ini = '#ffffff'
    self.colorom_btn_accion_fondo_fin= '#e6e6e6'
    self.colorom_btn_accion_fuente = '#000000'
    self.colorom_alerta_exito_fondo = '#dff0d8'
    self.colorom_alerta_exito_fuente = '#468847'
    self.colorom_alerta_problema_fondo = '#f8d7da'
    self.colorom_alerta_problema_fuente = '#721c24'
  end

  def self.setup(&block)
    yield self
  end

end
