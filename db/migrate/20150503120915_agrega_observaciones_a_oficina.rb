class AgregaObservacionesAOficina < ActiveRecord::Migration
  def change
    add_column :sip_oficina, :observaciones, :string, limit: 5000, null: true
  end
end
