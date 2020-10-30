include Sip::MigracionHelper

class CreaUbicacionpre < ActiveRecord::Migration[6.0]
  def up
    create_table :sip_ubicacionpre do |t|
      t.string :nombre, limit: 2000, null: false
      t.integer :pais_id
      t.integer :departamento_id
      t.integer :municipio_id
      t.integer :clase_id
      t.string :lugar, limit: 500
      t.string :sitio, limit:  500
      t.integer :tsitio_id
      t.float :latitud
      t.float :longitud
      t.timestamp :created_at, null: false
      t.timestamp :updated_at, null: false
    end
    cambiaCotejacion(:sip_ubicacionpre, :nombre, 2000, 'es_co_utf_8')
    add_foreign_key :sip_ubicacionpre, :sip_pais, column: :pais_id
    add_foreign_key :sip_ubicacionpre, :sip_departamento, column: :departamento_id
    add_foreign_key :sip_ubicacionpre, :sip_municipio, column: :municipio_id
    add_foreign_key :sip_ubicacionpre, :sip_clase, column: :clase_id
    add_foreign_key :sip_ubicacionpre, :sip_tsitio, column: :tsitio_id

    execute <<-SQL
      INSERT INTO sip_ubicacionpre (nombre, pais_id, latitud, 
        longitud, created_at, updated_at)
        (SELECT nombre, id, latitud, longitud, NOW(), NOW()
          FROM sip_pais);
    SQL
    execute <<-SQL
      INSERT INTO sip_ubicacionpre (nombre, pais_id, departamento_id,
        latitud, longitud, created_at, updated_at)
        (SELECT d.nombre || ' / ' || p.nombre, p.id, d.id, 
        d.latitud, d.longitud, NOW(), NOW()
        FROM sip_departamento AS d 
        JOIN sip_pais AS p ON d.id_pais=p.id);
    SQL
    execute <<-SQL
      INSERT INTO sip_ubicacionpre (nombre, pais_id, departamento_id,
        municipio_id, latitud, longitud, created_at, updated_at)
        (SELECT m.nombre || ' / ' || d.nombre || ' / ' || p.nombre, 
        p.id, d.id, m.id, m.latitud, m.longitud, NOW(), NOW()
        FROM sip_pais AS p
        JOIN sip_departamento AS d  ON d.id_pais=p.id
        JOIN sip_municipio AS m ON m.id_departamento=d.id
        );
    SQL
    execute <<-SQL
      INSERT INTO sip_ubicacionpre (nombre, pais_id, departamento_id,
        municipio_id, clase_id, latitud, longitud, 
        created_at, updated_at)
        (SELECT c.nombre || ' / ' || m.nombre || ' / ' || d.nombre || ' / '
        || p.nombre, p.id, d.id, m.id, c.id, c.latitud, c.longitud, 
        NOW(), NOW()
        FROM sip_pais AS p
        JOIN sip_departamento AS d  ON d.id_pais=p.id
        JOIN sip_municipio AS m ON m.id_departamento=d.id
        JOIN sip_clase AS c ON c.id_municipio=m.id
        );
    SQL
  end


  def down
    drop_table  :sip_ubicacionpre
  end
end
