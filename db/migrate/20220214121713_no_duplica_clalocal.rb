class NoDuplicaClalocal < ActiveRecord::Migration[6.1]
  def up
    execute <<-SQL

      ALTER TABLE ONLY public.sip_pais
        ADD CONSTRAINT sip_pais_codiso_unico
        UNIQUE (codiso);

      ALTER TABLE ONLY public.sip_departamento
        DROP CONSTRAINT IF EXISTS sip_departamento_id_pais_id_deplocal_key;
      ALTER TABLE ONLY public.sip_departamento
        ADD CONSTRAINT sip_departamento_id_pais_id_deplocal_unico
        UNIQUE (id_pais, id_deplocal);

      ALTER TABLE ONLY public.sip_municipio
        DROP CONSTRAINT IF EXISTS sip_municipio_id_departamento_id_munlocal_key;
      ALTER TABLE ONLY public.sip_municipio
        ADD CONSTRAINT sip_municipio_id_departamento_id_munlocal_unico
        UNIQUE (id_departamento, id_munlocal);

      ALTER TABLE ONLY public.sip_clase
        DROP CONSTRAINT IF EXISTS sip_clase_id_municipio_id_clalocal_key;
      ALTER TABLE ONLY public.sip_clase
        ADD CONSTRAINT sip_clase_id_municipio_id_clalocal_key 
        UNIQUE (id_municipio, id_clalocal);
    SQL
  end

  def down
    execute <<-SQL
      ALTER TABLE ONLY public.sip_clase
        DROP CONSTRAINT IF EXISTS sip_clase_id_municipio_id_clalocal_unico;

      ALTER TABLE ONLY public.sip_municipio
        DROP CONSTRAINT IF EXISTS sip_municipio_id_departamento_id_munlocal_unico;

      ALTER TABLE ONLY public.sip_departamento
        DROP CONSTRAINT IF EXISTS sip_departamento_id_pais_id_deplocal_unico;

      ALTER TABLE ONLY public.sip_pais
        DROP CONSTRAINT IF EXISTS sip_pais_codiso_unico;
 
    SQL
  end
end
