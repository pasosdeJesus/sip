class IndicesMejoraConscasosjr < ActiveRecord::Migration[6.0]
  def up
    add_index :sip_ubicacion, :id_pais
    add_index :sip_ubicacion, :id_departamento
    add_index :sip_ubicacion, :id_municipio
    add_index :sip_ubicacion, :id_clase
  end
end
