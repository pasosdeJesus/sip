class AgregaTipoorgAOrgsocial < ActiveRecord::Migration[7.0]
  def up
    if !column_exists?('sip_orgsocial', :tipoorg_id)
      add_column :sip_orgsocial, :tipoorg_id, :integer, null: false, default: 2
    end
  end

  def down
    remove_column :sip_orgsocial, :tipoorg_id
  end
end
