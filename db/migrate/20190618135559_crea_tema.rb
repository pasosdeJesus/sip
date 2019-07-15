class CreaTema < ActiveRecord::Migration[6.0]
  def change
    create_table :sip_tema do |t|
      t.string :nombre, limit: 500, null: false
      t.string :observaciones, limit: 5000
      t.string :nav_ini, limit: 8
      t.string :nav_fin, limit: 8
      t.string :nav_fuente, limit: 8
      t.string :fondo_lista, limit: 8
      t.date :fechacreacion, null: false
      t.date :fechadeshabilitacion
      t.timestamp :created_at, null: false
      t.timestamp :updated_at, null: false
    end
  end
end
