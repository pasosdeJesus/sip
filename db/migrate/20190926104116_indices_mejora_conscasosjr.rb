class IndicesMejoraConscasosjr < ActiveRecord::Migration[6.0]

  def change
    add_index :sip_ubicacion, :id_pais
    add_index :sip_ubicacion, :id_departamento
    add_index :sip_ubicacion, :id_municipio
    add_index :sip_ubicacion, :id_clase
    add_foreign_key :sip_ubicacion, :sip_pais, column: :id_pais
    add_foreign_key :sip_ubicacion, :sip_departamento, column: :id_departamento
    add_foreign_key :sip_ubicacion, :sip_municipio, column: :id_municipio
    add_foreign_key :sip_ubicacion, :sip_clase, column: :id_clase
  end

end
