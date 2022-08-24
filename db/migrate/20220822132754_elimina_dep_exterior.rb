class EliminaDepExterior < ActiveRecord::Migration[7.0]
  def up
    if Sip::Clase.where(id_municipio: [828, 523, 43, 685, 323]).count > 0
      puts "Hay centros poblados en paises codificados como muncipios"
      exit 1
    end
    if Sip::Etiqueta.connection.execute('SELECT COUNT(*) FROM sip_etiqueta_municipio WHERE municipio_id IN (828, 523, 43, 685, 323)')[0]['count'] > 0
      puts "Hay etiquetas en paises codificados como muncipios"
      exit 1
    end
    if Sip::Ubicacion.
        where(id_municipio: nil).
        where(id_departamento: 3).count > 0
      puts "Hay ubicaciones en EXTERIOR sin municipio"
      exit 1
    end
    if Sip::Persona.
        where(id_municipio: nil).
        where(id_departamento: 3).count > 0
      puts "Hay personas en EXTERIOR sin municipio"
      exit 1
    end

    execute <<-SQL
      DELETE FROM sip_ubicacionpre WHERE pais_id=170
        AND departamento_id=3
        AND municipio_id IS NULL;
    SQL

    execute <<-SQL
      UPDATE sip_ubicacion
        SET id_pais=76, id_departamento=NULL, id_municipio=NULL
        WHERE id_municipio=828 AND
        id_departamento=3 AND
        id_pais=170;
      UPDATE sip_ubicacionpre
        SET pais_id=76, departamento_id=NULL, municipio_id=NULL
        WHERE municipio_id=828 AND
        departamento_id=3 AND
        pais_id=170;
      UPDATE sip_persona
        SET id_pais=76, id_departamento=NULL, id_municipio=NULL
        WHERE id_municipio=828 AND
        id_departamento=3 AND
        id_pais=170;
      DELETE FROM sip_municipio WHERE id=828 and nombre='Brasil';
    SQL
    puts "Brasil"

    execute <<-SQL
      UPDATE sip_ubicacion
        SET id_pais=218, id_departamento=NULL, id_municipio=NULL
        WHERE id_municipio=523 AND
        id_departamento=3 AND
        id_pais=170;
      UPDATE sip_ubicacionpre
        SET pais_id=218, departamento_id=NULL, municipio_id=NULL
        WHERE municipio_id=523 AND
        departamento_id=3 AND
        pais_id=170;
      UPDATE sip_persona
        SET id_pais=218, id_departamento=NULL, id_municipio=NULL
        WHERE id_municipio=523 AND
        id_departamento=3 AND
        id_pais=170;
      DELETE FROM sip_municipio WHERE id=523 and nombre='Ecuador';
    SQL
    puts "Ecuador"

    execute <<-SQL
      UPDATE sip_ubicacion
        SET id_pais=591, id_departamento=NULL, id_municipio=NULL
        WHERE id_municipio=43 AND
        id_departamento=3 AND
        id_pais=170;
      UPDATE sip_ubicacionpre
        SET pais_id=591, departamento_id=NULL, municipio_id=NULL
        WHERE municipio_id=43 AND
        departamento_id=3 AND
        pais_id=170;
      UPDATE sip_persona
        SET id_pais=591, id_departamento=NULL, id_municipio=NULL
        WHERE id_municipio=43 AND
        id_departamento=3 AND
        id_pais=170;
      DELETE FROM sip_municipio WHERE id=43 and nombre='Panama';
    SQL
    puts "Panama"

    execute <<-SQL
      UPDATE sip_ubicacion
        SET id_pais=604, id_departamento=NULL, id_municipio=NULL
        WHERE id_municipio=685 AND
        id_departamento=3 AND
        id_pais=170;
      UPDATE sip_ubicacionpre
        SET pais_id=604, departamento_id=NULL, municipio_id=NULL
        WHERE municipio_id=685 AND
        departamento_id=3 AND
        pais_id=170;
      UPDATE sip_persona
        SET id_pais=604, id_departamento=NULL, id_municipio=NULL
        WHERE id_municipio=685 AND
        id_departamento=3 AND
        id_pais=170;
      DELETE FROM sip_municipio WHERE id=685 and nombre='Peru';
    SQL
    puts "Perú"

    execute <<-SQL
      UPDATE sip_ubicacion
        SET id_pais=862, id_departamento=NULL, id_municipio=NULL
        WHERE id_municipio=323 AND
        id_departamento=3 AND
        id_pais=170;
      UPDATE sip_ubicacionpre
        SET pais_id=862, departamento_id=NULL, municipio_id=NULL
        WHERE municipio_id=323 AND
        departamento_id=3 AND
        pais_id=170;
      UPDATE sip_persona
        SET id_pais=862, id_departamento=NULL, id_municipio=NULL
        WHERE id_municipio=323 AND
        id_departamento=3 AND
        id_pais=170;
      DELETE FROM sip_municipio WHERE id=323 and nombre='Venezuela';
    SQL
    puts "Venezuela"

    execute <<-SQL
      DELETE FROM sip_departamento WHERE id=3 and nombre='EXTERIOR';
    SQL
  end
  def down
    raise IrreversibleMigration
  end

end
