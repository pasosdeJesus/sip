class GrupoUsuario < ActiveRecord::Migration[5.0]
  def change
    create_join_table :usuario, :sip_grupo, table_name: :sip_grupo_usuario
    add_foreign_key :sip_grupo_usuario, :sip_grupo, column: :sip_grupo_id
    add_foreign_key :sip_grupo_usuario, :usuario, column: :usuario_id
  end
end
