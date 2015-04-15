class AgregaIdDepartamento < ActiveRecord::Migration
  def up
		execute <<-SQL
		  ALTER TABLE sip_departamento 
			DROP CONSTRAINT IF EXISTS departamento_pkey CASCADE;
		SQL
		execute <<-SQL
		  ALTER TABLE sip_departamento RENAME COLUMN id TO id_deplocal;
		SQL
		execute <<-SQL
		  ALTER TABLE sip_departamento ALTER COLUMN id_deplocal DROP DEFAULT;
		  ALTER TABLE sip_departamento ALTER COLUMN id_deplocal DROP NOT NULL;
		SQL
		execute <<-SQL
			ALTER TABLE sip_departamento ADD COLUMN id INTEGER UNIQUE
				DEFAULT(nextval('sip_departamento_id_seq'));
		SQL
		execute <<-SQL
		  ALTER TABLE sip_departamento ADD UNIQUE(id_pais, id_deplocal);
		SQL
		execute <<-SQL
      UPDATE sip_departamento SET id='1' WHERE id_deplocal='1' AND id_pais='862';
      UPDATE sip_departamento SET id='2' WHERE id_deplocal='10' AND id_pais='862';
      UPDATE sip_departamento SET id='3' WHERE id_deplocal='10000' AND id_pais='170';
      UPDATE sip_departamento SET id='4' WHERE id_deplocal='11' AND id_pais='170';
      UPDATE sip_departamento SET id='5' WHERE id_deplocal='11' AND id_pais='862';
      UPDATE sip_departamento SET id='6' WHERE id_deplocal='12' AND id_pais='862';
      UPDATE sip_departamento SET id='7' WHERE id_deplocal='13' AND id_pais='170';
      UPDATE sip_departamento SET id='8' WHERE id_deplocal='13' AND id_pais='862';
      UPDATE sip_departamento SET id='9' WHERE id_deplocal='14' AND id_pais='862';
      UPDATE sip_departamento SET id='10' WHERE id_deplocal='15' AND id_pais='862';
      UPDATE sip_departamento SET id='11' WHERE id_deplocal='15' AND id_pais='170';
      UPDATE sip_departamento SET id='12' WHERE id_deplocal='16' AND id_pais='862';
      UPDATE sip_departamento SET id='13' WHERE id_deplocal='17' AND id_pais='170';
      UPDATE sip_departamento SET id='14' WHERE id_deplocal='17' AND id_pais='862';
      UPDATE sip_departamento SET id='15' WHERE id_deplocal='18' AND id_pais='170';
      UPDATE sip_departamento SET id='16' WHERE id_deplocal='18' AND id_pais='862';
      UPDATE sip_departamento SET id='17' WHERE id_deplocal='19' AND id_pais='170';
      UPDATE sip_departamento SET id='18' WHERE id_deplocal='19' AND id_pais='862';
      UPDATE sip_departamento SET id='19' WHERE id_deplocal='2' AND id_pais='862';
      UPDATE sip_departamento SET id='20' WHERE id_deplocal='20' AND id_pais='170';
      UPDATE sip_departamento SET id='21' WHERE id_deplocal='20' AND id_pais='862';
      UPDATE sip_departamento SET id='22' WHERE id_deplocal='21' AND id_pais='862';
      UPDATE sip_departamento SET id='23' WHERE id_deplocal='22' AND id_pais='862';
      UPDATE sip_departamento SET id='24' WHERE id_deplocal='23' AND id_pais='170';
      UPDATE sip_departamento SET id='25' WHERE id_deplocal='23' AND id_pais='862';
      UPDATE sip_departamento SET id='26' WHERE id_deplocal='24' AND id_pais='862';
      UPDATE sip_departamento SET id='27' WHERE id_deplocal='25' AND id_pais='170';
      UPDATE sip_departamento SET id='28' WHERE id_deplocal='25' AND id_pais='862';
      UPDATE sip_departamento SET id='29' WHERE id_deplocal='27' AND id_pais='170';
      UPDATE sip_departamento SET id='30' WHERE id_deplocal='3' AND id_pais='862';
      UPDATE sip_departamento SET id='31' WHERE id_deplocal='4' AND id_pais='862';
      UPDATE sip_departamento SET id='32' WHERE id_deplocal='41' AND id_pais='170';
      UPDATE sip_departamento SET id='33' WHERE id_deplocal='44' AND id_pais='170';
      UPDATE sip_departamento SET id='34' WHERE id_deplocal='47' AND id_pais='170';
      UPDATE sip_departamento SET id='35' WHERE id_deplocal='5' AND id_pais='170';
      UPDATE sip_departamento SET id='36' WHERE id_deplocal='5' AND id_pais='862';
      UPDATE sip_departamento SET id='37' WHERE id_deplocal='50' AND id_pais='170';
      UPDATE sip_departamento SET id='38' WHERE id_deplocal='52' AND id_pais='170';
      UPDATE sip_departamento SET id='39' WHERE id_deplocal='54' AND id_pais='170';
      UPDATE sip_departamento SET id='40' WHERE id_deplocal='6' AND id_pais='862';
      UPDATE sip_departamento SET id='41' WHERE id_deplocal='63' AND id_pais='170';
      UPDATE sip_departamento SET id='42' WHERE id_deplocal='66' AND id_pais='170';
      UPDATE sip_departamento SET id='43' WHERE id_deplocal='68' AND id_pais='170';
      UPDATE sip_departamento SET id='44' WHERE id_deplocal='7' AND id_pais='862';
      UPDATE sip_departamento SET id='45' WHERE id_deplocal='70' AND id_pais='170';
      UPDATE sip_departamento SET id='46' WHERE id_deplocal='73' AND id_pais='170';
      UPDATE sip_departamento SET id='47' WHERE id_deplocal='76' AND id_pais='170';
      UPDATE sip_departamento SET id='48' WHERE id_deplocal='8' AND id_pais='170';
      UPDATE sip_departamento SET id='49' WHERE id_deplocal='8' AND id_pais='862';
      UPDATE sip_departamento SET id='50' WHERE id_deplocal='81' AND id_pais='170';
      UPDATE sip_departamento SET id='51' WHERE id_deplocal='85' AND id_pais='170';
      UPDATE sip_departamento SET id='52' WHERE id_deplocal='86' AND id_pais='170';
      UPDATE sip_departamento SET id='53' WHERE id_deplocal='88' AND id_pais='170';
      UPDATE sip_departamento SET id='54' WHERE id_deplocal='9' AND id_pais='862';
      UPDATE sip_departamento SET id='55' WHERE id_deplocal='91' AND id_pais='170';
      UPDATE sip_departamento SET id='56' WHERE id_deplocal='94' AND id_pais='170';
      UPDATE sip_departamento SET id='57' WHERE id_deplocal='95' AND id_pais='170';
      UPDATE sip_departamento SET id='58' WHERE id_deplocal='97' AND id_pais='170';
      UPDATE sip_departamento SET id='59' WHERE id_deplocal='99' AND id_pais='170';
		SQL

		execute <<-SQL
		  ALTER TABLE sip_departamento ALTER COLUMN id
			  SET NOT NULL;
		SQL
		execute <<-SQL
		  ALTER TABLE sip_departamento ADD CONSTRAINT 
			  sip_departamento_pkey PRIMARY KEY (id);
		SQL
		execute <<-SQL
		  SELECT setval('sip_departamento_id_seq', MAX(id)) FROM  
				(SELECT 100 as id UNION  
					SELECT MAX(id) FROM sip_departamento) AS s;
		SQL

		execute <<-SQL
		  ALTER TABLE sip_municipio RENAME COLUMN id_departamento TO id_deplocal
		SQL
		execute <<-SQL
		  ALTER TABLE sip_municipio ADD COLUMN id_departamento 
				INTEGER REFERENCES sip_departamento(id);
		SQL
		execute <<-SQL
		  UPDATE sip_municipio SET id_departamento=sip_departamento.id 
			  FROM sip_departamento 
				WHERE sip_municipio.id_pais=sip_departamento.id_pais
			    AND sip_municipio.id_deplocal=sip_departamento.id_deplocal;
		SQL

		execute <<-SQL
		  ALTER TABLE sip_clase RENAME COLUMN id_departamento TO id_deplocal
		SQL
		execute <<-SQL
		  ALTER TABLE sip_clase ADD COLUMN id_departamento 
				INTEGER REFERENCES sip_departamento(id);
		SQL
		execute <<-SQL
		  UPDATE sip_clase SET id_departamento=sip_departamento.id 
			  FROM sip_departamento 
				WHERE sip_clase.id_pais=sip_departamento.id_pais
			    AND sip_clase.id_deplocal=sip_departamento.id_deplocal;
		SQL

	 execute <<-SQL
    ALTER TABLE sip_ubicacion RENAME COLUMN id_departamento TO id_deplocal
   SQL
   execute <<-SQL
    ALTER TABLE sip_ubicacion ADD COLUMN id_departamento 
        INTEGER REFERENCES sip_departamento(id);
   SQL
   execute <<-SQL
    UPDATE sip_ubicacion SET id_departamento=sip_departamento.id 
      FROM sip_departamento 
			WHERE sip_ubicacion.id_pais=sip_departamento.id_pais
        AND sip_ubicacion.id_deplocal=sip_departamento.id_deplocal;
   SQL

	 execute <<-SQL
    ALTER TABLE sip_persona RENAME COLUMN id_departamento TO id_deplocal
   SQL
   execute <<-SQL
    ALTER TABLE sip_persona ADD COLUMN id_departamento 
        INTEGER REFERENCES sip_departamento(id);
   SQL
   execute <<-SQL
    UPDATE sip_persona SET id_departamento=sip_departamento.id 
      FROM sip_departamento 
			WHERE sip_persona.id_pais=sip_departamento.id_pais
        AND sip_persona.id_deplocal=sip_departamento.id_deplocal;
   SQL

		execute <<-SQL
		    DROP MATERIALIZED VIEW IF EXISTS sivel2_gen_conscaso;
		    DROP VIEW IF EXISTS sivel2_gen_conscaso1;
		    ALTER TABLE sip_ubicacion DROP COLUMN id_deplocal;
		    ALTER TABLE sip_persona DROP COLUMN id_deplocal;
			  ALTER TABLE sip_clase DROP COLUMN id_deplocal;
			  ALTER TABLE sip_municipio DROP COLUMN id_deplocal;
		SQL
		#Pendiente
		#  execute <<-SQL
		#    ALTER TABLE sip_municipio DROP COLUMN id_pais;
		#   SQL
	end
	def down
		raise ActiveRecord::IrreversibleMigration    
	end
end
