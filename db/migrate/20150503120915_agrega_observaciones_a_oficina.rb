class AgregaObservacionesAOficina < ActiveRecord::Migration[4.2]
  def change
    add_column :sip_oficina, :observaciones, :string, limit: 5000, null: true
  end
end
