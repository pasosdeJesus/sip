class AgregaUsuarionotificarASolicitud < ActiveRecord::Migration[6.0]
  def change
      create_table :sip_solicitud_usuarionotificar, id: false do |t|
      t.integer :usuarionotificar_id
      t.integer :solicitud_id
      t.index :usuarionotificar_id
      t.index :solicitud_id
    end
    add_foreign_key :sip_solicitud_usuarionotificar, 
      :usuario, column: :usuarionotificar_id
    add_foreign_key :sip_solicitud_usuarionotificar, 
      :sip_solicitud, column: :solicitud_id
  end
end
