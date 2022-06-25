class CreaSolicitud < ActiveRecord::Migration[6.0]
  def up
    if !table_exists?(:sip_solicitud) then
      create_table :sip_solicitud do |t|
        t.integer :usuario_id, null: false
        t.date :fecha, null: false
        t.string :solicitud, limit: 5000
        t.integer :estadosol_id
        t.timestamp :created_at, null: false
        t.timestamp :updated_at, null: false
      end
      add_foreign_key :sip_solicitud, :usuario, column: :usuario_id
      add_foreign_key :sip_solicitud, :sip_estadosol, column: :estadosol_id
    end
  end

  def down
    drop_table :sip_solicitud
  end
end
