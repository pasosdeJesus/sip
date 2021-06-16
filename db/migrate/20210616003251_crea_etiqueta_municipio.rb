class CreaEtiquetaMunicipio < ActiveRecord::Migration[6.1]
  def change
    create_join_table :sip_etiqueta, :sip_municipio,
      table_name: 'sip_etiqueta_municipio'
    add_foreign_key :sip_etiqueta_municipio, :sip_etiqueta
    add_foreign_key :sip_etiqueta_municipio, :sip_municipio
    rename_column :sip_etiqueta_municipio, :sip_etiqueta_id,
      :etiqueta_id
    rename_column :sip_etiqueta_municipio, :sip_municipio_id,
      :municipio_id
  end
end
