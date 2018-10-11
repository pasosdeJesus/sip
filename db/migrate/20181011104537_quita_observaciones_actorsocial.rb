class QuitaObservacionesActorsocial < ActiveRecord::Migration[5.2]
  def change
    remove_column :sip_actorsocial, :observaciones, :string, limit: 5000
  end
end
