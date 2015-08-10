class MundepSinDeshabilitados < ActiveRecord::Migration
  def up
    execute <<-SQL
      DROP INDEX sip_busca_mundep;
      DROP MATERIALIZED VIEW sip_mundep;
      DROP VIEW sip_mundep_sinorden;

      CREATE VIEW sip_mundep_sinorden AS (
        SELECT sip_departamento.id_deplocal*1000 + 
            sip_municipio.id_munlocal AS idlocal,
            sip_municipio.nombre || ' / ' || sip_departamento.nombre AS nombre
        FROM sip_municipio INNER JOIN sip_departamento 
          ON sip_municipio.id_departamento=sip_departamento.id
        WHERE sip_departamento.id_pais = 170 
          AND sip_municipio.fechadeshabilitacion IS NULL
          AND sip_departamento.fechadeshabilitacion IS NULL
        UNION SELECT sip_departamento.id_deplocal, 
          sip_departamento.nombre AS nombre
        FROM sip_departamento
        WHERE sip_departamento.id_pais = 170
        AND sip_departamento.fechadeshabilitacion IS NULL
      );
      CREATE MATERIALIZED VIEW sip_mundep AS (
        SELECT idlocal, nombre, 
            to_tsvector('spanish', unaccent(nombre)) AS mundep
        FROM sip_mundep_sinorden
        ORDER BY nombre COLLATE "es_co_utf_8"
      );
      CREATE INDEX sip_busca_mundep ON sip_mundep USING gin(mundep);
      REFRESH MATERIALIZED VIEW sip_mundep;
    SQL
  end
  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
