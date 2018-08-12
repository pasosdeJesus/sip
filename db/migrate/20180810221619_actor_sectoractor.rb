class ActorSectoractor < ActiveRecord::Migration[5.2]
  def change
    create_table :sip_actorsocial_sectoractor, id: false do |t|
      t.integer :actorsocial_id
      t.integer :sectoractor_id
    end
    add_foreign_key :sip_actorsocial_sectoractor, :sip_actorsocial, 
      column: :actorsocial_id
    add_foreign_key :sip_actorsocial_sectoractor, :sip_sectoractor, 
      column: :sectoractor_id
  end
end
