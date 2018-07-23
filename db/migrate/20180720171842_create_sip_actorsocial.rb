class CreateSipActorsocial < ActiveRecord::Migration[5.2]
  def change
    create_table :sip_actorsocial do |t|
      t.integer :grupoper_id, null: false, index: true
      t.string :telefono, limit: 500
      t.string :fax, limit: 500
      t.string :direccion, limit: 500
      t.integer :pais_id, index: true
      t.string :web, limit: 500
      t.string :observaciones, limit: 5000
      t.timestamp :created_at, null: false
      t.timestamp :updated_at, null: false
    end
    add_foreign_key :sip_actorsocial, :sip_pais, column: :pais_id
    add_foreign_key :sip_actorsocial, :sip_grupoper, column: :grupoper_id
  end
end
