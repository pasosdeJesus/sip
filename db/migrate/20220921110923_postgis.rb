class Postgis < ActiveRecord::Migration[7.0]
  def up
    execute <<-SQL
      CREATE EXTENSION IF NOT EXISTS postgis; 

      ALTER TABLE sip_pais ADD osm_id INTEGER;
      ALTER TABLE sip_pais ADD osm_frontera geography(MULTIPOLYGON, 4326); 

      ALTER TABLE sip_departamento ADD osm_id INTEGER;
      ALTER TABLE sip_departamento ADD osm_frontera geography(MULTIPOLYGON, 4326);

      ALTER TABLE sip_municipio ADD osm_id INTEGER;
      ALTER TABLE sip_municipio ADD osm_frontera geography(MULTIPOLYGON, 4326);

      ALTER TABLE sip_clase ADD osm_id INTEGER;
      ALTER TABLE sip_clase ADD osm_frontera geography(MULTIPOLYGON, 4326);
    SQL
  end

  def down
    execute <<-SQL
      ALTER TABLE sip_clase DROP osm_frontera;
      ALTER TABLE sip_clase DROP osm_id;
      ALTER TABLE sip_municipio DROP osm_frontera;
      ALTER TABLE sip_municipio DROP osm_id;
      ALTER TABLE sip_departamento DROP osm_frontera;
      ALTER TABLE sip_departamento DROP osm_id;
      ALTER TABLE sip_pais DROP osm_frontera;
      ALTER TABLE sip_pais DROP osm_id;
      DROP EXTENSION postgis; 
    SQL
  end
end
