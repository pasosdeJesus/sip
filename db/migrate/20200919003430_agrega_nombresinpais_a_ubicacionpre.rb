class AgregaNombresinpaisAUbicacionpre < ActiveRecord::Migration[6.0]
  def up
    add_column :sip_ubicacionpre, :nombre_sin_pais, :string, limit: 500
    execute <<-SQL
      UPDATE sip_ubicacionpre SET  nombre_sin_pais=d.nombre
        FROM sip_departamento AS d WHERE d.id=departamento_id;
      UPDATE sip_ubicacionpre SET  
        nombre_sin_pais=m.nombre || ' / ' || d.nombre
        FROM sip_departamento AS d, sip_municipio AS m 
        WHERE d.id=sip_ubicacionpre.departamento_id 
          AND m.id=sip_ubicacionpre.municipio_id
          AND m.id_departamento=d.id;
      UPDATE sip_ubicacionpre SET  
        nombre_sin_pais=c.nombre || ' / ' || m.nombre || ' / ' || d.nombre
        FROM sip_departamento AS d, sip_municipio AS m, sip_clase AS c
        WHERE d.id=sip_ubicacionpre.departamento_id 
          AND m.id=sip_ubicacionpre.municipio_id
          AND m.id_departamento=d.id
          AND c.id=sip_ubicacionpre.clase_id
          AND c.id_municipio=m.id;
    SQL
  end

  def down
    remove_column :sip_ubicacionpre, :nombre_sin_pais
  end
end
