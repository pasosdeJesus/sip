class AgregaCodregDepartamento < ActiveRecord::Migration[7.0]
  def up
    if !column_exists?(:sip_departamento, :codreg)
      add_column :sip_departamento, :codreg, :integer
      execute <<-SQL
        UPDATE sip_departamento SET codreg=1 WHERE id_pais=170 AND id_deplocal=5; -- Antioquia
        UPDATE sip_departamento SET codreg=3 WHERE id_pais=170 AND id_deplocal=8; -- Atlántico
        UPDATE sip_departamento SET codreg=5 WHERE id_pais=170 AND id_deplocal=13; -- Bolívar
        UPDATE sip_departamento SET codreg=7 WHERE id_pais=170 AND id_deplocal=15; -- Boyacá
        UPDATE sip_departamento SET codreg=9 WHERE id_pais=170 AND id_deplocal=17; -- Caldas
        UPDATE sip_departamento SET codreg=11 WHERE id_pais=170 AND id_deplocal=19; -- Cauca
        UPDATE sip_departamento SET codreg=12 WHERE id_pais=170 AND id_deplocal=20; -- Cesar
        UPDATE sip_departamento SET codreg=13 WHERE id_pais=170 AND id_deplocal=23; -- Córdoba
        UPDATE sip_departamento SET codreg=15 WHERE id_pais=170 AND id_deplocal=25; -- Cundinamarca
        UPDATE sip_departamento SET codreg=17 WHERE id_pais=170 AND id_deplocal=27; -- Chocó
        UPDATE sip_departamento SET codreg=19 WHERE id_pais=170 AND id_deplocal=41; -- Huila
        UPDATE sip_departamento SET codreg=21 WHERE id_pais=170 AND id_deplocal=47; -- Magdalena
        UPDATE sip_departamento SET codreg=23 WHERE id_pais=170 AND id_deplocal=52; -- Nariño
        UPDATE sip_departamento SET codreg=24 WHERE id_pais=170 AND id_deplocal=66; -- Risaralda
        UPDATE sip_departamento SET codreg=26 WHERE id_pais=170 AND id_deplocal=63; -- Quindío
        UPDATE sip_departamento SET codreg=27 WHERE id_pais=170 AND id_deplocal=68; -- Santander
        UPDATE sip_departamento SET codreg=28 WHERE id_pais=170 AND id_deplocal=70; -- Sucre
        UPDATE sip_departamento SET codreg=29 WHERE id_pais=170 AND id_deplocal=73; -- Tolima
        UPDATE sip_departamento SET codreg=40 WHERE id_pais=170 AND id_deplocal=81; -- Arauca
        UPDATE sip_departamento SET codreg=44 WHERE id_pais=170 AND id_deplocal=18; -- Caquetá
        UPDATE sip_departamento SET codreg=46 WHERE id_pais=170 AND id_deplocal=85; -- Casanare
        UPDATE sip_departamento SET codreg=48 WHERE id_pais=170 AND id_deplocal=44; -- La Guajira
        UPDATE sip_departamento SET codreg=50 WHERE id_pais=170 AND id_deplocal=94; -- Guainía
        UPDATE sip_departamento SET codreg=52 WHERE id_pais=170 AND id_deplocal=50; -- Meta
        UPDATE sip_departamento SET codreg=54 WHERE id_pais=170 AND id_deplocal=95; -- Guaviare
        UPDATE sip_departamento SET codreg=60 WHERE id_pais=170 AND id_deplocal=91; -- Amazonas
        UPDATE sip_departamento SET codreg=64 WHERE id_pais=170 AND id_deplocal=86; -- Putumayo
        UPDATE sip_departamento SET codreg=68 WHERE id_pais=170 AND id_deplocal=97; -- Vaupés
        UPDATE sip_departamento SET codreg=72 WHERE id_pais=170 AND id_deplocal=99; -- Vichada
        UPDATE sip_departamento SET codreg=56 WHERE id_pais=170 AND id_deplocal=88; -- Archipiélago de San Andrés, Providencia y Santa Catalina
        UPDATE sip_departamento SET codreg=31 WHERE id_pais=170 AND id_deplocal=76; -- Valle del Cauca
        UPDATE sip_departamento SET codreg=25 WHERE id_pais=170 AND id_deplocal=54; -- Norte de Santander
        UPDATE sip_departamento SET codreg=25 WHERE id_pais=170 AND id_deplocal=54; -- Norte de Santander
        UPDATE sip_departamento SET codreg=16 WHERE id_pais=170 AND id_deplocal=11; -- Bogotá, D.C.
      SQL
    end
  end
  def down
    remove_column :sip_departamento, :codreg, :integer
  end
end
