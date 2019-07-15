class TemaUsuario < ActiveRecord::Migration[6.0]
  def change
    add_column :usuario, :tema_id, :integer
    add_foreign_key :usuario, :sip_tema, column: :tema_id
  end
end
