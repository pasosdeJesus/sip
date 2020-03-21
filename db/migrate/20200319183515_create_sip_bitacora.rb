class CreateSipBitacora < ActiveRecord::Migration[6.0]
  def change
    create_table :sip_bitacora do |t|
      t.timestamp :fecha, null: false
      t.string :ip, limit: 100
      t.integer :usuario_id
      t.string :url, limit: 1023
      t.string :params, limit: 5000
      t.string :modelo, limit: 511
      t.integer :modelo_id
      t.string :operacion, limit: 63
      t.json :detalle
      t.timestamp :created_at, null: false
      t.timestamp :updated_at, null: false
    end
    add_foreign_key :sip_bitacora, :usuario, column: :usuario_id
  end
end
