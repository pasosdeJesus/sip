class AgregaIdPersonaTrelacion < ActiveRecord::Migration
  def up
    execute <<-SQL
      CREATE SEQUENCE sip_persona_trelacion_id_seq;      
    SQL
    execute <<-SQL
      ALTER TABLE sip_persona_trelacion
        DROP CONSTRAINT IF EXISTS persona_trelacion_pkey CASCADE;
    SQL
    execute <<-SQL
      ALTER TABLE sip_persona_trelacion ADD 
        UNIQUE(persona1, persona2, id_trelacion);
    SQL
    execute <<-SQL
      ALTER TABLE sip_persona_trelacion ALTER COLUMN persona1
        SET NOT NULL;
    SQL
    execute <<-SQL
      ALTER TABLE sip_persona_trelacion ALTER COLUMN persona2
        SET NOT NULL;
    SQL
    execute <<-SQL
      ALTER TABLE sip_persona_trelacion ALTER COLUMN id_trelacion
        SET NOT NULL;
    SQL
    execute <<-SQL
      ALTER TABLE sip_persona_trelacion ADD COLUMN id INTEGER NOT NULL
        UNIQUE DEFAULT(nextval('sip_persona_trelacion_id_seq'));
    SQL
    execute <<-SQL
      ALTER TABLE sip_persona_trelacion 
        DROP CONSTRAINT IF EXISTS relacion_personas_pkey;
    SQL
    execute <<-SQL
      ALTER TABLE sip_persona_trelacion ADD CONSTRAINT 
        sip_persona_trelacion_pkey PRIMARY KEY (id);
    SQL
  end

  def down
    execute <<-SQL
      ALTER TABLE sip_persona_trelacion 
        DROP CONSTRAINT sip_persona_trelacion_pkey;
    SQL
    execute <<-SQL
      ALTER TABLE sip_persona_trelacion  DROP COLUMN id;
    SQL
    execute <<-SQL
      ALTER TABLE sip_persona_trelacion  ADD CONSTRAINT
        persona_trelacion_pkey PRIMARY KEY (persona1, persona2, id_trelacion);
    SQL
    execute <<-SQL
      DROP SEQUENCE sip_persona_trelacion_id_seq;
    SQL
  end
end
