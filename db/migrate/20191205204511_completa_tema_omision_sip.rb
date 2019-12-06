class CompletaTemaOmisionSip < ActiveRecord::Migration[6.0]
  def up
    t = Sip::Tema.find(1)
    t.fondo = '#ffffff'
    t.color_fuente = '#000000'
    t.nav_ini = '#95c4ff'
    t.nav_fin = '#266dd3'
    t.nav_fuente = '#ffffff'
    t.fondo_lista = '#95c4ff'
    t.btn_primario_fondo_ini = '#0088cc'
    t.btn_primario_fondo_fin = '#0044cc'
    t.btn_primario_fuente = '#ffffff'
    t.btn_peligro_fondo_ini = '#ee5f5b'
    t.btn_peligro_fondo_fin = '#bd362f'
    t.btn_peligro_fuente = '#ffffff'
    t.btn_accion_fondo_ini = '#ffffff'
    t.btn_accion_fondo_fin= '#e6e6e6'
    t.btn_accion_fuente = '#000000'
    t.alerta_exito_fondo = '#dff0d8'
    t.alerta_exito_fuente = '#468847'
    t.alerta_problema_fondo = '#f8d7da'
    t.alerta_problema_fuente = '#721c24'
    t.save!
  end
  def down
  end
end
