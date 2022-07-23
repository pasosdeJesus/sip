class CreateVereda < ActiveRecord::Migration[7.0]
  include Sip::SqlHelper
  def up
    create_table :sip_vereda do |t|
      t.string :nombre, limit: 500, null: false
      t.integer :municipio_id
      t.integer :verlocal_id
      t.string :observaciones, limit: 5000
      t.float :latitud
      t.float :longitud
      t.date :fechacreacion, null: false
      t.date :fechadeshabilitacion

      t.timestamps
    end
    cambiaCotejacion('sip_vereda', 'nombre', 500, 'es_co_utf_8')
  end

  def down
    drop_table :sip_vereda
  end
end
