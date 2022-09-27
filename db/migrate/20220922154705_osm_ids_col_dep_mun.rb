class OsmIdsColDepMun < ActiveRecord::Migration[7.0]
  def up
    execute <<-SQL

      UPDATE sip_pais SET osm_id=120027 WHERE id=170; -- Colombia

      UPDATE sip_departamento SET osm_id=1303962 WHERE id_pais=170 AND id_deplocal=91; -- Amazonas
      UPDATE sip_departamento SET osm_id=2181889 WHERE id_pais=170 AND id_deplocal=88; --  San Andrés ...
      UPDATE sip_departamento SET osm_id=1315120 WHERE id_pais=170 AND id_deplocal=5; -- Antioquia
      UPDATE sip_departamento SET osm_id=1388045 WHERE id_pais=170 AND id_deplocal=81; -- Arauca
      UPDATE sip_departamento SET osm_id=1315209 WHERE id_pais=170 AND id_deplocal=8; -- Atlántico
      UPDATE sip_departamento SET osm_id=1316581 WHERE id_pais=170 AND id_deplocal=13; -- Bolívar
      UPDATE sip_departamento SET osm_id=1390144 WHERE id_pais=170 AND id_deplocal=15; -- Boyacá
      UPDATE sip_departamento SET osm_id=396705 WHERE id_pais=170 AND id_deplocal=17; -- Caldas
      UPDATE sip_departamento SET osm_id=1394843 WHERE id_pais=170 AND id_deplocal=18; -- Caquetá
      UPDATE sip_departamento SET osm_id=1392025 WHERE id_pais=170 AND id_deplocal=85; -- Casanare
      UPDATE sip_departamento SET osm_id=1392085 WHERE id_pais=170 AND id_deplocal=19; -- Cauca
      UPDATE sip_departamento SET osm_id=1317223 WHERE id_pais=170 AND id_deplocal=20; -- Cesar
      UPDATE sip_departamento SET osm_id=1322131 WHERE id_pais=170 AND id_deplocal=27; -- Chocó
      UPDATE sip_departamento SET osm_id=1321032 WHERE id_pais=170 AND id_deplocal=23; -- Córdoba
      UPDATE sip_departamento SET osm_id=1305533 WHERE id_pais=170 AND id_deplocal=25; -- Cundinamarca
      UPDATE sip_departamento SET osm_id=1385038 WHERE id_pais=170 AND id_deplocal=94; -- Guainía
      UPDATE sip_departamento SET osm_id=1380540 WHERE id_pais=170 AND id_deplocal=95; -- Guaviare
      UPDATE sip_departamento SET osm_id=1396291 WHERE id_pais=170 AND id_deplocal=41; -- Huila
      UPDATE sip_departamento SET osm_id=1321379 WHERE id_pais=170 AND id_deplocal=44; -- La Guajira
      UPDATE sip_departamento SET osm_id=1319097 WHERE id_pais=170 AND id_deplocal=47; -- Magdalena
      UPDATE sip_departamento SET osm_id=1305166 WHERE id_pais=170 AND id_deplocal=50; -- Meta
      UPDATE sip_departamento SET osm_id=1380130 WHERE id_pais=170 AND id_deplocal=52; -- Nariño
      UPDATE sip_departamento SET osm_id=1324192 WHERE id_pais=170 AND id_deplocal=54; -- Norte de Santander
      UPDATE sip_departamento SET osm_id=1375357 WHERE id_pais=170 AND id_deplocal=86; -- Putumayo
      UPDATE sip_departamento SET osm_id=1331230 WHERE id_pais=170 AND id_deplocal=63; -- Quindío
      UPDATE sip_departamento SET osm_id=1374221 WHERE id_pais=170 AND id_deplocal=66; -- Risaralda
      UPDATE sip_departamento SET osm_id=1372374 WHERE id_pais=170 AND id_deplocal=68; -- Santander
      UPDATE sip_departamento SET osm_id=1320759 WHERE id_pais=170 AND id_deplocal=70; -- Sucre
      UPDATE sip_departamento SET osm_id=1309495 WHERE id_pais=170 AND id_deplocal=73; -- Tolima
      UPDATE sip_departamento SET osm_id=1322825 WHERE id_pais=170 AND id_deplocal=76; -- Valle del Cauca
      UPDATE sip_departamento SET osm_id=1359366 WHERE id_pais=170 AND id_deplocal=97; -- Vaupés
      UPDATE sip_departamento SET osm_id=1357098 WHERE id_pais=170 AND id_deplocal=99; -- Vichada

      UPDATE sip_departamento SET osm_id=12893646 WHERE id_pais=170 AND id_deplocal=11; -- Bogotá
    SQL
  end

  def down
    execute <<-SQL
      UPDATE sip_pais SET osm_id=NULL WHERE id=170; -- Colombia

      UPDATE sip_departamento SET osm_id=NULL WHERE id_pais=170 AND id_deplocal=91; -- Amazonas
      UPDATE sip_departamento SET osm_id=NULL WHERE id_pais=170 AND id_deplocal=88; --  San Andrés ...
      UPDATE sip_departamento SET osm_id=NULL WHERE id_pais=170 AND id_deplocal=5; -- Antioquia
      UPDATE sip_departamento SET osm_id=NULL WHERE id_pais=170 AND id_deplocal=81; -- Arauca
      UPDATE sip_departamento SET osm_id=NULL WHERE id_pais=170 AND id_deplocal=8; -- Atlántico
      UPDATE sip_departamento SET osm_id=NULL WHERE id_pais=170 AND id_deplocal=13; -- Bolívar
      UPDATE sip_departamento SET osm_id=NULL WHERE id_pais=170 AND id_deplocal=15; -- Boyacá
      UPDATE sip_departamento SET osm_id=NULL WHERE id_pais=170 AND id_deplocal=17; -- Caldas
      UPDATE sip_departamento SET osm_id=NULL WHERE id_pais=170 AND id_deplocal=18; -- Caquetá
      UPDATE sip_departamento SET osm_id=NULL WHERE id_pais=170 AND id_deplocal=85; -- Casanare
      UPDATE sip_departamento SET osm_id=NULL WHERE id_pais=170 AND id_deplocal=19; -- Cauca
      UPDATE sip_departamento SET osm_id=NULL WHERE id_pais=170 AND id_deplocal=20; -- Cesar
      UPDATE sip_departamento SET osm_id=NULL WHERE id_pais=170 AND id_deplocal=27; -- Chocó
      UPDATE sip_departamento SET osm_id=NULL WHERE id_pais=170 AND id_deplocal=23; -- Córdoba
      UPDATE sip_departamento SET osm_id=NULL WHERE id_pais=170 AND id_deplocal=25; -- Cundinamarca
      UPDATE sip_departamento SET osm_id=NULL WHERE id_pais=170 AND id_deplocal=94; -- Guainía
      UPDATE sip_departamento SET osm_id=NULL WHERE id_pais=170 AND id_deplocal=95; -- Guaviare
      UPDATE sip_departamento SET osm_id=NULL WHERE id_pais=170 AND id_deplocal=41; -- Huila
      UPDATE sip_departamento SET osm_id=NULL WHERE id_pais=170 AND id_deplocal=44; -- La Guajira
      UPDATE sip_departamento SET osm_id=NULL WHERE id_pais=170 AND id_deplocal=47; -- Magdalena
      UPDATE sip_departamento SET osm_id=NULL WHERE id_pais=170 AND id_deplocal=50; -- Meta
      UPDATE sip_departamento SET osm_id=NULL WHERE id_pais=170 AND id_deplocal=52; -- Nariño
      UPDATE sip_departamento SET osm_id=NULL WHERE id_pais=170 AND id_deplocal=54; -- Norte de Santander
      UPDATE sip_departamento SET osm_id=NULL WHERE id_pais=170 AND id_deplocal=86; -- Putumayo
      UPDATE sip_departamento SET osm_id=NULL WHERE id_pais=170 AND id_deplocal=63; -- Quindío
      UPDATE sip_departamento SET osm_id=NULL WHERE id_pais=170 AND id_deplocal=66; -- Risaralda
      UPDATE sip_departamento SET osm_id=NULL WHERE id_pais=170 AND id_deplocal=68; -- Santander
      UPDATE sip_departamento SET osm_id=NULL WHERE id_pais=170 AND id_deplocal=70; -- Sucre
      UPDATE sip_departamento SET osm_id=NULL WHERE id_pais=170 AND id_deplocal=73; -- Tolima
      UPDATE sip_departamento SET osm_id=NULL WHERE id_pais=170 AND id_deplocal=76; -- Valle del Cauca
      UPDATE sip_departamento SET osm_id=NULL WHERE id_pais=170 AND id_deplocal=97; -- Vaupés
      UPDATE sip_departamento SET osm_id=NULL WHERE id_pais=170 AND id_deplocal=99; -- Vichada

      UPDATE sip_departamento SET osm_id=NULL WHERE id_pais=170 AND id_deplocal=11; -- Bogotá
    SQL
  end
end
