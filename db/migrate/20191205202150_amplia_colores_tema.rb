class AmpliaColoresTema < ActiveRecord::Migration[6.0]
  def change
    add_column :sip_tema, :btn_primario_fondo_ini, :string, limit: 127
    add_column :sip_tema, :btn_primario_fondo_fin, :string, limit: 127
    add_column :sip_tema, :btn_primario_fuente, :string, limit: 127
    add_column :sip_tema, :btn_peligro_fondo_ini, :string, limit: 127
    add_column :sip_tema, :btn_peligro_fondo_fin, :string, limit: 127
    add_column :sip_tema, :btn_peligro_fuente,:string, limit: 127
    add_column :sip_tema, :btn_accion_fondo_ini, :string, limit: 127
    add_column :sip_tema, :btn_accion_fondo_fin, :string, limit: 127
    add_column :sip_tema, :btn_accion_fuente, :string, limit: 127
    add_column :sip_tema, :alerta_exito_fondo, :string, limit: 127
    add_column :sip_tema, :alerta_exito_fuente, :string, limit: 127
    add_column :sip_tema, :alerta_problema_fondo, :string, limit: 127
    add_column :sip_tema, :alerta_problema_fuente, :string, limit: 127
    add_column :sip_tema, :fondo, :string, limit: 127
    add_column :sip_tema, :color_fuente, :string, limit: 127
  end
end
