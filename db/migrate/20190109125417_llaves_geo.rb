class LlavesGeo < ActiveRecord::Migration[5.2]
  def up
    add_foreign_key :sip_departamento, :sip_pais, column: :id_pais
    add_foreign_key :sip_municipio, :sip_departamento, column: :id_departamento
    add_foreign_key :sip_clase, :sip_municipio, column: :id_municipio
  end
end
