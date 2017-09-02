class AgregaObservacionesABasicas < ActiveRecord::Migration[4.2]
  def change
    add_column :sip_clase, :observaciones, :string, limit: 5000, null: true
    add_column :sip_departamento, :observaciones, :string, limit: 5000, null: true
    add_column :sip_municipio, :observaciones, :string, limit: 5000, null: true
    add_column :sip_pais, :observaciones, :string, limit: 5000, null: true
    add_column :sip_tclase, :observaciones, :string, limit: 5000, null: true
    add_column :sip_tdocumento, :observaciones, :string, limit: 5000, null: true
    add_column :sip_tsitio, :observaciones, :string, limit: 5000, null: true
  end
end
