class DeptoAltasbajas < ActiveRecord::Migration[7.0]
  def up
    add_column :sip_departamento, :codiso, :string, limit: 6
    add_column :sip_departamento, :catiso, :string, limit: 64
    # Colombia
    execute <<-SQL
      UPDATE sip_departamento SET codiso='CO-AMA', catiso='Departamento', nombre='Amazonas', observaciones='Código ISO de https://www.iso.org/obp/ui/#iso:code:3166:CO' WHERE id=55;
      UPDATE sip_departamento SET codiso='CO-ANT', catiso='Departamento', nombre='Antioquia', observaciones='Código ISO de https://www.iso.org/obp/ui/#iso:code:3166:CO' WHERE id=35;
      UPDATE sip_departamento SET codiso='CO-ARA', catiso='Departamento', nombre='Arauca', observaciones='Código ISO de https://www.iso.org/obp/ui/#iso:code:3166:CO' WHERE id=50;
      UPDATE sip_departamento SET codiso='CO-SAP', catiso='Departamento', nombre='Archipiélago de San Andrés, Providencia y Santa Catalina', observaciones='Código ISO de https://www.iso.org/obp/ui/#iso:code:3166:CO' WHERE id=53;
      UPDATE sip_departamento SET codiso='CO-ATL', catiso='Departamento', nombre='Atlántico', observaciones='Código ISO de https://www.iso.org/obp/ui/#iso:code:3166:CO' WHERE id=48;
      UPDATE sip_departamento SET codiso='CO-DC', catiso='Distrito Capital', nombre='Bogotá, D.C.', observaciones='Departamento cambiado en revisión de DIVIPOLA 2019, antes era BOGOTÁ D.C. Código ISO de https://www.iso.org/obp/ui/#iso:code:3166:CO' WHERE id=4;
      UPDATE sip_departamento SET codiso='CO-BOL', catiso='Departamento', nombre='Bolívar', observaciones='Código ISO de https://www.iso.org/obp/ui/#iso:code:3166:CO' WHERE id=7;
      UPDATE sip_departamento SET codiso='CO-BOY', catiso='Departamento', nombre='Boyacá', observaciones='Código ISO de https://www.iso.org/obp/ui/#iso:code:3166:CO' WHERE id=11;
      UPDATE sip_departamento SET codiso='CO-CAL', catiso='Departamento', nombre='Caldas', observaciones='Código ISO de https://www.iso.org/obp/ui/#iso:code:3166:CO' WHERE id=13;
      UPDATE sip_departamento SET codiso='CO-CAQ', catiso='Departamento', nombre='Caquetá', observaciones='Código ISO de https://www.iso.org/obp/ui/#iso:code:3166:CO' WHERE id=15;
      UPDATE sip_departamento SET codiso='CO-CAS', catiso='Departamento', nombre='Casanare', observaciones='Código ISO de https://www.iso.org/obp/ui/#iso:code:3166:CO' WHERE id=51;
      UPDATE sip_departamento SET codiso='CO-CAU', catiso='Departamento', nombre='Cauca', observaciones='Código ISO de https://www.iso.org/obp/ui/#iso:code:3166:CO' WHERE id=17;
      UPDATE sip_departamento SET codiso='CO-CES', catiso='Departamento', nombre='Cesar', observaciones='Código ISO de https://www.iso.org/obp/ui/#iso:code:3166:CO' WHERE id=20;
      UPDATE sip_departamento SET codiso='CO-CHO', catiso='Departamento', nombre='Chocó', observaciones='Código ISO de https://www.iso.org/obp/ui/#iso:code:3166:CO' WHERE id=29;
      UPDATE sip_departamento SET codiso='CO-COR', catiso='Departamento', nombre='Córdoba', observaciones='Código ISO de https://www.iso.org/obp/ui/#iso:code:3166:CO' WHERE id=24;
      UPDATE sip_departamento SET codiso='CO-CUN', catiso='Departamento', nombre='Cundinamarca', observaciones='Código ISO de https://www.iso.org/obp/ui/#iso:code:3166:CO' WHERE id=27;
      UPDATE sip_departamento SET codiso='CO-GUA', catiso='Departamento', nombre='Guainía', observaciones='Código ISO de https://www.iso.org/obp/ui/#iso:code:3166:CO' WHERE id=56;
      UPDATE sip_departamento SET codiso='CO-GUV', catiso='Departamento', nombre='Guaviare', observaciones='Código ISO de https://www.iso.org/obp/ui/#iso:code:3166:CO' WHERE id=57;
      UPDATE sip_departamento SET codiso='CO-HUI', catiso='Departamento', nombre='Huila', observaciones='Código ISO de https://www.iso.org/obp/ui/#iso:code:3166:CO' WHERE id=32;
      UPDATE sip_departamento SET codiso='CO-LAG', catiso='Departamento', nombre='La Guajira', observaciones='Código ISO de https://www.iso.org/obp/ui/#iso:code:3166:CO' WHERE id=33;
      UPDATE sip_departamento SET codiso='CO-MAG', catiso='Departamento', nombre='Magdalena', observaciones='Código ISO de https://www.iso.org/obp/ui/#iso:code:3166:CO' WHERE id=34;
      UPDATE sip_departamento SET codiso='CO-MET', catiso='Departamento', nombre='Meta', observaciones='Código ISO de https://www.iso.org/obp/ui/#iso:code:3166:CO' WHERE id=37;
      UPDATE sip_departamento SET codiso='CO-NAR', catiso='Departamento', nombre='Nariño', observaciones='Código ISO de https://www.iso.org/obp/ui/#iso:code:3166:CO' WHERE id=38;
      UPDATE sip_departamento SET codiso='CO-NSA', catiso='Departamento', nombre='Norte de Santander', observaciones='Código ISO de https://www.iso.org/obp/ui/#iso:code:3166:CO' WHERE id=39;
      UPDATE sip_departamento SET codiso='CO-PUT', catiso='Departamento', nombre='Putumayo', observaciones='Código ISO de https://www.iso.org/obp/ui/#iso:code:3166:CO' WHERE id=52;
      UPDATE sip_departamento SET codiso='CO-QUI', catiso='Departamento', nombre='Quindío', observaciones='Departamento cambiado en revisión de DIVIPOLA 2019, antes era QUINDIO. Código ISO de https://www.iso.org/obp/ui/#iso:code:3166:CO' WHERE id=41;
      UPDATE sip_departamento SET codiso='CO-RIS', catiso='Departamento', nombre='Risaralda', observaciones='Código ISO de https://www.iso.org/obp/ui/#iso:code:3166:CO' WHERE id=42;
      UPDATE sip_departamento SET codiso='CO-SAN', catiso='Departamento', nombre='Santander', observaciones='Código ISO de https://www.iso.org/obp/ui/#iso:code:3166:CO' WHERE id=43;
      UPDATE sip_departamento SET codiso='CO-SUC', catiso='Departamento', nombre='Sucre', observaciones='Código ISO de https://www.iso.org/obp/ui/#iso:code:3166:CO' WHERE id=45;
      UPDATE sip_departamento SET codiso='CO-TOL', catiso='Departamento', nombre='Tolima', observaciones='Código ISO de https://www.iso.org/obp/ui/#iso:code:3166:CO' WHERE id=46;
      UPDATE sip_departamento SET codiso='CO-VAC', catiso='Departamento', nombre='Valle del Cauca', observaciones='Código ISO de https://www.iso.org/obp/ui/#iso:code:3166:CO' WHERE id=47;
      UPDATE sip_departamento SET codiso='CO-VAU', catiso='Departamento', nombre='Vaupés', observaciones='Código ISO de https://www.iso.org/obp/ui/#iso:code:3166:CO' WHERE id=58;
      UPDATE sip_departamento SET codiso='CO-VID', catiso='Departamento', nombre='Vichada', observaciones='Código ISO de https://www.iso.org/obp/ui/#iso:code:3166:CO' WHERE id=59;
    SQL
    # Otros países
    execute <<-SQL
      UPDATE sip_departamento SET nombre=initcap(nombre) WHERE id_pais<>170;
    SQL

  end

  def down
    # Otros países
    execute <<-SQL
      UPDATE sip_departamento SET nombre=upper(nombre) WHERE id_pais<>170;
    SQL

    execute <<-SQL
      UPDATE sip_departamento SET nombre='BOYACÁ' WHERE id=11;
      UPDATE sip_departamento SET nombre='CALDAS' WHERE id=13;
      UPDATE sip_departamento SET nombre='CAQUETÁ' WHERE id=15;
      UPDATE sip_departamento SET nombre='CAUCA' WHERE id=17;
      UPDATE sip_departamento SET nombre='CESAR' WHERE id=20;
      UPDATE sip_departamento SET nombre='CÓRDOBA' WHERE id=24;
      UPDATE sip_departamento SET nombre='CUNDINAMARCA' WHERE id=27;
      UPDATE sip_departamento SET nombre='CHOCÓ' WHERE id=29;
      UPDATE sip_departamento SET nombre='EXTERIOR' WHERE id=3;
      UPDATE sip_departamento SET nombre='HUILA' WHERE id=32;
      UPDATE sip_departamento SET nombre='LA GUAJIRA' WHERE id=33;
      UPDATE sip_departamento SET nombre='MAGDALENA' WHERE id=34;
      UPDATE sip_departamento SET nombre='ANTIOQUIA' WHERE id=35;
      UPDATE sip_departamento SET nombre='META' WHERE id=37;
      UPDATE sip_departamento SET nombre='NARIÑO' WHERE id=38;
      UPDATE sip_departamento SET nombre='NORTE DE SANTANDER' WHERE id=39;
      UPDATE sip_departamento SET nombre='BOGOTÁ, D.C.', observaciones='Departamento cambiado en revisión de DIVIPOLA 2019, antes era BOGOTÁ D.C.' WHERE id=4;
      UPDATE sip_departamento SET nombre='QUINDÍO', observaciones='Departamento cambiado en revisión de DIVIPOLA 2019, antes era QUINDIO.' WHERE id=41;
      UPDATE sip_departamento SET nombre='RISARALDA' WHERE id=42;
      UPDATE sip_departamento SET nombre='SANTANDER' WHERE id=43;
      UPDATE sip_departamento SET nombre='SUCRE' WHERE id=45;
      UPDATE sip_departamento SET nombre='TOLIMA' WHERE id=46;
      UPDATE sip_departamento SET nombre='VALLE DEL CAUCA' WHERE id=47;
      UPDATE sip_departamento SET nombre='ATLÁNTICO' WHERE id=48;
      UPDATE sip_departamento SET nombre='ARAUCA' WHERE id=50;
      UPDATE sip_departamento SET nombre='CASANARE' WHERE id=51;
      UPDATE sip_departamento SET nombre='PUTUMAYO' WHERE id=52;
      UPDATE sip_departamento SET nombre='ARCHIPIÉLAGO DE SAN ANDRÉS, PROVIDENCIA Y SANTA CATALINA' WHERE id=53;
      UPDATE sip_departamento SET nombre='AMAZONAS' WHERE id=55;
      UPDATE sip_departamento SET nombre='GUAINÍA' WHERE id=56;
      UPDATE sip_departamento SET nombre='GUAVIARE' WHERE id=57;
      UPDATE sip_departamento SET nombre='VAUPÉS' WHERE id=58;
      UPDATE sip_departamento SET nombre='VICHADA' WHERE id=59;
      UPDATE sip_departamento SET nombre='BOLÍVAR' WHERE id=7;
    SQL
    remove_column :sip_departamento, :codiso
    remove_column :sip_departamento, :catiso
  end
end
