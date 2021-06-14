class RenombraActorOrg < ActiveRecord::Migration[6.1]
  def change
    rename_table :sip_actorsocial, :sip_orgsocial
    rename_table :sip_actorsocial_persona, :sip_orgsocial_persona
    rename_table :sip_sectoractor, :sip_sectororgsocial
    rename_table :sip_actorsocial_sectoractor, :sip_orgsocial_sectororgsocial
    rename_table :sip_perfilactorsocial, :sip_perfilorgsocial
    rename_column :sip_orgsocial_persona, :actorsocial_id, :orgsocial_id
    rename_column :sip_orgsocial_persona, :perfilactorsocial_id, :perfilorgsocial_id
    rename_column :sip_orgsocial_sectororgsocial, :actorsocial_id, :orgsocial_id
    rename_column :sip_orgsocial_sectororgsocial, :sectoractor_id, :sectororgsocial_id
  end
end
