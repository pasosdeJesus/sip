class Divipola2021 < ActiveRecord::Migration[6.1]
  def up
    execute <<-SQL

      UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2021.'),  fechadeshabilitacion='2022-02-13'   WHERE id='6465'; -- 5001012 LA LOMA
      UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2021.'),  fechadeshabilitacion='2022-02-13'   WHERE id='6572'; -- 5040003 MONTEFRÍO
      UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2021.'),  fechadeshabilitacion='2022-02-13'   WHERE id='6593'; -- 5045007 LOS NARANJALES
      UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2021.'),  fechadeshabilitacion='2022-02-13'   WHERE id='6600'; -- 5045008 VIJAGUAL
      UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2021.'),  fechadeshabilitacion='2022-02-13'   WHERE id='6777'; -- 5154025 CAMPO ALEGRE
      UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2021.'),  fechadeshabilitacion='2022-02-13'   WHERE id='7135'; -- 5543001 BARBACOAS
      UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2021.'),  fechadeshabilitacion='2022-02-13'   WHERE id='7277'; -- 5656006 MESTIZAL
      UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2021.'),  fechadeshabilitacion='2022-02-13'   WHERE id='7279'; -- 5656007 POLEAL
      UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2021.'),  fechadeshabilitacion='2022-02-13'   WHERE id='7280'; -- 5656011 EL POMAR
      UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2021.'),  fechadeshabilitacion='2022-02-13'   WHERE id='7310'; -- 5660006 EL PRODIGIO
      UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2021.'),  fechadeshabilitacion='2022-02-13'   WHERE id='7396'; -- 5736004 EL CENIZO
      UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2021.'),  fechadeshabilitacion='2022-02-13'   WHERE id='7392'; -- 5736005 EL CRISTO
      UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2021.'),  fechadeshabilitacion='2022-02-13'   WHERE id='7389'; -- 5736007 LA CALIENTE
      UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2021.'),  fechadeshabilitacion='2022-02-13'   WHERE id='375'; -- 13160008 LA ESPERANZA
      UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2021.'),  fechadeshabilitacion='2022-02-13'   WHERE id='379'; -- 13160013 LEJANÍAS
      UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2021.'),  fechadeshabilitacion='2022-02-13'   WHERE id='212'; -- 13160020 YANACUÉ
      UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2021.'),  fechadeshabilitacion='2022-02-13'   WHERE id='2569'; -- 19573005 PERICO NEGRO
      UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2021.'),  fechadeshabilitacion='2022-02-13'   WHERE id='2639'; -- 19701005 SANTA MARTHA
      UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2021.'),  fechadeshabilitacion='2022-02-13'   WHERE id='2650'; -- 19701015 SECTOR MANDIYACO
      UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2021.'),  fechadeshabilitacion='2022-02-13'   WHERE id='2865'; -- 20001033 VERACRUZ
      UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2021.'),  fechadeshabilitacion='2022-02-13'   WHERE id='3662'; -- 23417011 SAN ANTERITO
      UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2021.'),  fechadeshabilitacion='2022-02-13'   WHERE id='4464'; -- 25307001 SAN LORENZO
      UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2021.'),  fechadeshabilitacion='2022-02-13'   WHERE id='4801'; -- 25785011 LOURDES
      UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2021.'),  fechadeshabilitacion='2022-02-13'   WHERE id='4854'; -- 25839009 SOYA
      UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2021.'),  fechadeshabilitacion='2022-02-13'   WHERE id='5020'; -- 27025015 DOCACINA
      UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2021.'),  fechadeshabilitacion='2022-02-13'   WHERE id='5060'; -- 27050004 REAL DE TANANDÓ
      UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2021.'),  fechadeshabilitacion='2022-02-13'   WHERE id='5088'; -- 27075001 CUPICA
      UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2021.'),  fechadeshabilitacion='2022-02-13'   WHERE id='5159'; -- 27150008 APARTADÓ BUENA VISTA
      UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2021.'),  fechadeshabilitacion='2022-02-13'   WHERE id='5291'; -- 27413003 LA VUELTA
      UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2021.'),  fechadeshabilitacion='2022-02-13'   WHERE id='5296'; -- 27413010 OGODÓ
      UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2021.'),  fechadeshabilitacion='2022-02-13'   WHERE id='5661'; -- 41078010 LA UNIÓN
      UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2021.'),  fechadeshabilitacion='2022-02-13'   WHERE id='5662'; -- 41078011 TURQUESTÁN
      UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2021.'),  fechadeshabilitacion='2022-02-13'   WHERE id='5745'; -- 41396003 MOSCOPÁN
      UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2021.'),  fechadeshabilitacion='2022-02-13'   WHERE id='14666'; -- 47555022 LAS PLANADAS
      UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2021.'),  fechadeshabilitacion='2022-02-13'   WHERE id='7678'; -- 50001028 PARCELAS DEL PROGRESO
      UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2021.'),  fechadeshabilitacion='2022-02-13'   WHERE id='7692'; -- 50001031 SAN CARLOS
      UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2021.'),  fechadeshabilitacion='2022-02-13'   WHERE id='14689'; -- 50245006 SAN JOSE
      UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2021.'),  fechadeshabilitacion='2022-02-13'   WHERE id='7787'; -- 50350002 LOS POZOS
      UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2021.'),  fechadeshabilitacion='2022-02-13'   WHERE id='14697'; -- 50350011 LA TUNIA
      UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2021.'),  fechadeshabilitacion='2022-02-13'   WHERE id='14702'; -- 50350016 VILLA CARDONA
      UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2021.'),  fechadeshabilitacion='2022-02-13'   WHERE id='7862'; -- 50711001 CAMPO ALEGRE
      UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2021.'),  fechadeshabilitacion='2022-02-13'   WHERE id='8407'; -- 52405005 NARIÑO
      UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2021.'),  fechadeshabilitacion='2022-02-13'   WHERE id='8401'; -- 52405013 FLORIDA BAJA
      UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2021.'),  fechadeshabilitacion='2022-02-13'   WHERE id='8542'; -- 52560011 CUASPUD NUCLEO
      UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2021.'),  fechadeshabilitacion='2022-02-13'   WHERE id='8555'; -- 52573001 EL PÁRAMO
      UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2021.'),  fechadeshabilitacion='2022-02-13'   WHERE id='8581'; -- 52621013 PALOSECO
      UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2021.'),  fechadeshabilitacion='2022-02-13'   WHERE id='8654'; -- 52683008 BOHÓRQUEZ
      UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2021.'),  fechadeshabilitacion='2022-02-13'   WHERE id='8651'; -- 52683019 LA REGADERA
      UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2021.'),  fechadeshabilitacion='2022-02-13'   WHERE id='8788'; -- 52835055 BOCAS DE CURAY
      UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2021.'),  fechadeshabilitacion='2022-02-13'   WHERE id='8890'; -- 52835206 OLIVO CURAY
      UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2021.'),  fechadeshabilitacion='2022-02-13'   WHERE id='8805'; -- 52835220 SANDER CURAY
      UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2021.'),  fechadeshabilitacion='2022-02-13'   WHERE id='8803'; -- 52835222 SOLEDAD CURAY I
      UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2021.'),  fechadeshabilitacion='2022-02-13'   WHERE id='8801'; -- 52835223 SOLEDAD CURAY II
      UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2021.'),  fechadeshabilitacion='2022-02-13'   WHERE id='10835'; -- 70523002 GUAIMARAL
      UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2021.'),  fechadeshabilitacion='2022-02-13'   WHERE id='11770'; -- 76109094 KATANGA
      UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2021.'),  fechadeshabilitacion='2022-02-13'   WHERE id='12328'; -- 76823003 LA PRADERA
      UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2021.'),  fechadeshabilitacion='2022-02-13'   WHERE id='12756'; -- 85139006 SAN JOAQUÍN DE GARIBAY
      UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2021.'),  fechadeshabilitacion='2022-02-13'   WHERE id='13088'; -- 95001011 PUERTO OSPINA

      UPDATE sip_clase SET nombre = 'DOS QUEBRADAS',
        observaciones=completa_obs(observaciones, 'Nombre cambiando en DIVIPOLA 2021, antes era DOSQUEBRADAS') WHERE id='12351';

        UPDATE sip_clase SET id_tclase='CP' WHERE id=8117;

        UPDATE sip_clase SET fechadeshabilitacion=NULL,
        observaciones=completa_obs(observaciones, 'Vuelto a habilitar por DIVIPOLA 2021'),
        id_tclase='CP'
        WHERE id='1872'; -- CAQUETÁ | SAN VICENTE DEL CAGUÁN | LOS POZOS
        

        INSERT INTO sip_clase (id, nombre, id_municipio, id_clalocal, observaciones, fechacreacion, created_at, updated_at)  
          VALUES (15404, 'BALSILLA', 1069, 6, 'Agregado en DIVIPOLA 2021', '2021-02-13', '2021-02-13', '2021-02-13');
        INSERT INTO sip_clase (id, nombre, id_municipio, id_clalocal, observaciones, fechacreacion, created_at, updated_at)  
          VALUES (15405, 'LA TUNIA', 1214, 23, 'Agregado en DIVIPOLA 2021', '2021-02-13', '2021-02-13', '2021-02-13');
        INSERT INTO sip_clase (id, nombre, id_municipio, id_clalocal, observaciones, fechacreacion, created_at, updated_at)  
          VALUES (15406, 'VILLA CARMONA', 1214, 34, 'Agregado en DIVIPOLA 2021', '2021-02-13', '2021-02-13', '2021-02-13');
        INSERT INTO sip_clase (id, nombre, id_municipio, id_clalocal, observaciones, fechacreacion, created_at, updated_at)  
          VALUES (15407, 'TOCASINA - DUBASA', 1237, 34, 'Agregado en DIVIPOLA 2021', '2021-02-13', '2021-02-13', '2021-02-13');
        INSERT INTO sip_clase (id, nombre, id_municipio, id_clalocal, observaciones, fechacreacion, created_at, updated_at)  
          VALUES (15408, 'CUPICA', 633, 9, 'Agregado en DIVIPOLA 2021', '2021-02-13', '2021-02-13', '2021-02-13');
        INSERT INTO sip_clase (id, nombre, id_municipio, id_clalocal, observaciones, fechacreacion, created_at, updated_at)  
          VALUES (15409, 'SAN MIGUEL', 612, 6, 'Agregado en DIVIPOLA 2021', '2021-02-13', '2021-02-13', '2021-02-13');
        INSERT INTO sip_clase (id, nombre, id_municipio, id_clalocal, observaciones, fechacreacion, created_at, updated_at)  
          VALUES (15410, 'PUEBLO NUEVO - GETSEMANÍ', 954, 15, 'Agregado en DIVIPOLA 2021', '2021-02-13', '2021-02-13', '2021-02-13');
        INSERT INTO sip_clase (id, nombre, id_municipio, id_clalocal, observaciones, fechacreacion, created_at, updated_at)  
          VALUES (15411, 'SAN JOSÉ', 1130, 3, 'Agregado en DIVIPOLA 2021. En DIVIPOLA 2021 erradamente estaba en SAN JUAN DE ARAMA pero es en SAN JUANITO.', '2021-02-13', '2021-02-13', '2021-02-13');
        INSERT INTO sip_clase (id, nombre, id_municipio, id_clalocal, observaciones, fechacreacion, created_at, updated_at)  
          VALUES (15412, 'BOCAS DE CURAY', 879, 7, 'Agregado en DIVIPOLA 2021', '2021-02-13', '2021-02-13', '2021-02-13');
        INSERT INTO sip_clase (id, nombre, id_municipio, id_clalocal, observaciones, fechacreacion, created_at, updated_at)  
          VALUES (15413, 'OLIVO CURAY', 879, 15, 'Agregado en DIVIPOLA 2021', '2021-02-13', '2021-02-13', '2021-02-13');
        INSERT INTO sip_clase (id, nombre, id_municipio, id_clalocal, observaciones, fechacreacion, created_at, updated_at)  
          VALUES (15414, 'SANDER CURAY', 879, 16, 'Agregado en DIVIPOLA 2021', '2021-02-13', '2021-02-13', '2021-02-13');
        INSERT INTO sip_clase (id, nombre, id_municipio, id_clalocal, observaciones, fechacreacion, created_at, updated_at)  
          VALUES (15415, 'SOLEDAD CURAY I', 879, 17, 'Agregado en DIVIPOLA 2021', '2021-02-13', '2021-02-13', '2021-02-13');
        INSERT INTO sip_clase (id, nombre, id_municipio, id_clalocal, observaciones, fechacreacion, created_at, updated_at)  
          VALUES (15416, 'SOLEDAD CURAY II', 879, 18, 'Agregado en DIVIPOLA 2021', '2021-02-13', '2021-02-13', '2021-02-13');
        INSERT INTO sip_clase (id, nombre, id_municipio, id_clalocal, observaciones, fechacreacion, created_at, updated_at)  
          VALUES (15417, 'INVASIÓN LA INDEPENDENCIA', 958, 31, 'Agregado en DIVIPOLA 2021', '2021-02-13', '2021-02-13', '2021-02-13');
        INSERT INTO sip_clase (id, nombre, id_municipio, id_clalocal, observaciones, fechacreacion, created_at, updated_at)  
          VALUES (15418, 'LOS GUADUALES', 946, 14, 'Agregado en DIVIPOLA 2021', '2021-02-13', '2021-02-13', '2021-02-13');
        INSERT INTO sip_clase (id, nombre, id_municipio, id_clalocal, observaciones, fechacreacion, created_at, updated_at)  
          VALUES (15419, 'MARGEN IZQUIERDO', 39, 11, 'Agregado en DIVIPOLA 2021', '2021-02-13', '2021-02-13', '2021-02-13');
        INSERT INTO sip_clase (id, nombre, id_municipio, id_clalocal, observaciones, fechacreacion, created_at, updated_at)  
          VALUES (15420, '12 DE OCTUBRE', 39, 12, 'Agregado en DIVIPOLA 2021', '2021-02-13', '2021-02-13', '2021-02-13');
        INSERT INTO sip_clase (id, nombre, id_municipio, id_clalocal, observaciones, fechacreacion, created_at, updated_at)  
          VALUES (15421, 'TAPURUCUARA', 39, 13, 'Agregado en DIVIPOLA 2021', '2021-02-13', '2021-02-13', '2021-02-13');
    SQL
  end

  def down
    execute <<-SQL

      UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2021.'),  fechadeshabilitacion=NULL   WHERE id='6465'; -- 5001012 LA LOMA
      UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2021.'),  fechadeshabilitacion=NULL   WHERE id='6572'; -- 5040003 MONTEFRÍO
      UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2021.'),  fechadeshabilitacion=NULL   WHERE id='6593'; -- 5045007 LOS NARANJALES
      UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2021.'),  fechadeshabilitacion=NULL   WHERE id='6600'; -- 5045008 VIJAGUAL
      UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2021.'),  fechadeshabilitacion=NULL   WHERE id='6777'; -- 5154025 CAMPO ALEGRE
      UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2021.'),  fechadeshabilitacion=NULL   WHERE id='7135'; -- 5543001 BARBACOAS
      UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2021.'),  fechadeshabilitacion=NULL   WHERE id='7277'; -- 5656006 MESTIZAL
      UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2021.'),  fechadeshabilitacion=NULL   WHERE id='7279'; -- 5656007 POLEAL
      UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2021.'),  fechadeshabilitacion=NULL   WHERE id='7280'; -- 5656011 EL POMAR
      UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2021.'),  fechadeshabilitacion=NULL   WHERE id='7310'; -- 5660006 EL PRODIGIO
      UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2021.'),  fechadeshabilitacion=NULL   WHERE id='7396'; -- 5736004 EL CENIZO
      UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2021.'),  fechadeshabilitacion=NULL   WHERE id='7392'; -- 5736005 EL CRISTO
      UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2021.'),  fechadeshabilitacion=NULL   WHERE id='7389'; -- 5736007 LA CALIENTE
      UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2021.'),  fechadeshabilitacion=NULL   WHERE id='375'; -- 13160008 LA ESPERANZA
      UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2021.'),  fechadeshabilitacion=NULL   WHERE id='379'; -- 13160013 LEJANÍAS
      UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2021.'),  fechadeshabilitacion=NULL   WHERE id='212'; -- 13160020 YANACUÉ
      UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2021.'),  fechadeshabilitacion=NULL   WHERE id='2569'; -- 19573005 PERICO NEGRO
      UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2021.'),  fechadeshabilitacion=NULL   WHERE id='2639'; -- 19701005 SANTA MARTHA
      UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2021.'),  fechadeshabilitacion=NULL   WHERE id='2650'; -- 19701015 SECTOR MANDIYACO
      UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2021.'),  fechadeshabilitacion=NULL   WHERE id='2865'; -- 20001033 VERACRUZ
      UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2021.'),  fechadeshabilitacion=NULL   WHERE id='3662'; -- 23417011 SAN ANTERITO
      UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2021.'),  fechadeshabilitacion=NULL   WHERE id='4464'; -- 25307001 SAN LORENZO
      UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2021.'),  fechadeshabilitacion=NULL   WHERE id='4801'; -- 25785011 LOURDES
      UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2021.'),  fechadeshabilitacion=NULL   WHERE id='4854'; -- 25839009 SOYA
      UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2021.'),  fechadeshabilitacion=NULL   WHERE id='5020'; -- 27025015 DOCACINA
      UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2021.'),  fechadeshabilitacion=NULL   WHERE id='5060'; -- 27050004 REAL DE TANANDÓ
      UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2021.'),  fechadeshabilitacion=NULL   WHERE id='5088'; -- 27075001 CUPICA
      UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2021.'),  fechadeshabilitacion=NULL   WHERE id='5159'; -- 27150008 APARTADÓ BUENA VISTA
      UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2021.'),  fechadeshabilitacion=NULL   WHERE id='5291'; -- 27413003 LA VUELTA
      UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2021.'),  fechadeshabilitacion=NULL   WHERE id='5296'; -- 27413010 OGODÓ
      UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2021.'),  fechadeshabilitacion=NULL   WHERE id='5661'; -- 41078010 LA UNIÓN
      UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2021.'),  fechadeshabilitacion=NULL   WHERE id='5662'; -- 41078011 TURQUESTÁN
      UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2021.'),  fechadeshabilitacion=NULL   WHERE id='5745'; -- 41396003 MOSCOPÁN
      UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2021.'),  fechadeshabilitacion=NULL   WHERE id='14666'; -- 47555022 LAS PLANADAS
      UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2021.'),  fechadeshabilitacion=NULL   WHERE id='7678'; -- 50001028 PARCELAS DEL PROGRESO
      UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2021.'),  fechadeshabilitacion=NULL   WHERE id='7692'; -- 50001031 SAN CARLOS
      UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2021.'),  fechadeshabilitacion=NULL   WHERE id='14689'; -- 50245006 SAN JOSE
      UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2021.'),  fechadeshabilitacion=NULL   WHERE id='7787'; -- 50350002 LOS POZOS
      UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2021.'),  fechadeshabilitacion=NULL   WHERE id='14697'; -- 50350011 LA TUNIA
      UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2021.'),  fechadeshabilitacion=NULL   WHERE id='14702'; -- 50350016 VILLA CARDONA
      UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2021.'),  fechadeshabilitacion=NULL   WHERE id='7862'; -- 50711001 CAMPO ALEGRE
      UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2021.'),  fechadeshabilitacion=NULL   WHERE id='8407'; -- 52405005 NARIÑO
      UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2021.'),  fechadeshabilitacion=NULL   WHERE id='8401'; -- 52405013 FLORIDA BAJA
      UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2021.'),  fechadeshabilitacion=NULL   WHERE id='8542'; -- 52560011 CUASPUD NUCLEO
      UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2021.'),  fechadeshabilitacion=NULL   WHERE id='8555'; -- 52573001 EL PÁRAMO
      UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2021.'),  fechadeshabilitacion=NULL   WHERE id='8581'; -- 52621013 PALOSECO
      UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2021.'),  fechadeshabilitacion=NULL   WHERE id='8654'; -- 52683008 BOHÓRQUEZ
      UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2021.'),  fechadeshabilitacion=NULL   WHERE id='8651'; -- 52683019 LA REGADERA
      UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2021.'),  fechadeshabilitacion=NULL   WHERE id='8788'; -- 52835055 BOCAS DE CURAY
      UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2021.'),  fechadeshabilitacion=NULL   WHERE id='8890'; -- 52835206 OLIVO CURAY
      UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2021.'),  fechadeshabilitacion=NULL   WHERE id='8805'; -- 52835220 SANDER CURAY
      UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2021.'),  fechadeshabilitacion=NULL   WHERE id='8803'; -- 52835222 SOLEDAD CURAY I
      UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2021.'),  fechadeshabilitacion=NULL   WHERE id='8801'; -- 52835223 SOLEDAD CURAY II
      UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2021.'),  fechadeshabilitacion=NULL   WHERE id='10835'; -- 70523002 GUAIMARAL
      UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2021.'),  fechadeshabilitacion=NULL   WHERE id='11770'; -- 76109094 KATANGA
      UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2021.'),  fechadeshabilitacion=NULL   WHERE id='12328'; -- 76823003 LA PRADERA
      UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2021.'),  fechadeshabilitacion=NULL   WHERE id='12756'; -- 85139006 SAN JOAQUÍN DE GARIBAY
      UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2021.'),  fechadeshabilitacion=NULL   WHERE id='13088'; -- 95001011 PUERTO OSPINA

      UPDATE sip_clase SET nombre = 'DOSQUEBRADAS'
        WHERE id='12351';

        UPDATE sip_clase SET id_tclase='IPD' WHERE id=8117;
        DELETE FROM sip_clase 
          WHERE id>=15404 AND id<=15421;

        UPDATE sip_clase SET fechadeshabilitacion='2019-03-15',
        id_tclase='IP'
        WHERE id='1872'; -- CAQUETÁ | SAN VICENTE DEL CAGUÁN | LOS POZOS
 
    SQL
  end

end
