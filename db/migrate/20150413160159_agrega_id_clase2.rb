class AgregaIdClase2 < ActiveRecord::Migration[4.2]
  def up
    execute <<-SQL
      SELECT * FROM sip_clase WHERE
        id IS NULL;
    SQL
    execute <<-SQL
      ALTER TABLE sip_clase ALTER COLUMN id
        SET NOT NULL;
    SQL
    execute <<-SQL
      ALTER TABLE sip_clase ADD CONSTRAINT 
        sip_clase_pkey PRIMARY KEY (id);
    SQL
    execute <<-SQL
      SELECT setval('sip_departamento_id_seq', MAX(id)) FROM  
        (SELECT 100 as id UNION  
          SELECT MAX(id) FROM sip_departamento) AS s;
    SQL
    execute <<-SQL
     ALTER TABLE sip_clase ADD UNIQUE(id);
    SQL
    execute <<-SQL
     ALTER TABLE sip_clase ALTER COLUMN id
       SET DEFAULT(nextval('sip_clase_id_seq'));
    SQL
    execute <<-SQL
    	ALTER TABLE sip_ubicacion RENAME COLUMN id_clase TO id_clalocal
    SQL
    execute <<-SQL
      ALTER TABLE sip_ubicacion ADD COLUMN id_clase 
        INTEGER REFERENCES sip_clase(id);
    SQL
    execute <<-SQL
      UPDATE sip_ubicacion SET id_clase=sip_clase.id 
        FROM sip_clase 
        WHERE sip_ubicacion.id_municipio=sip_clase.id_municipio
          AND sip_ubicacion.id_clalocal=sip_clase.id_clalocal;
    SQL

    execute <<-SQL
      ALTER TABLE sip_persona RENAME COLUMN id_clase TO id_clalocal
    SQL
    execute <<-SQL
      ALTER TABLE sip_persona ADD COLUMN id_clase 
        INTEGER REFERENCES sip_clase(id);
    SQL
    execute <<-SQL
      UPDATE sip_persona SET id_clase=sip_clase.id 
        FROM sip_clase 
        WHERE sip_persona.id_municipio=sip_clase.id_municipio
          AND sip_persona.id_clalocal=sip_clase.id_clalocal;
    SQL

    execute <<-SQL
      ALTER TABLE sip_ubicacion DROP COLUMN id_clalocal;
      ALTER TABLE sip_persona DROP COLUMN id_clalocal;
    SQL

    # Pais y departamento se pueden referenciar por municipio
    execute <<-SQL
      ALTER TABLE sip_clase DROP COLUMN id_pais;
      ALTER TABLE sip_clase DROP COLUMN id_departamento;
    SQL
  end

  def down
    raise ActiveRecord::IrreversibleMigration    
  end
end
