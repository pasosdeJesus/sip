class Divipola2020 < ActiveRecord::Migration[6.1]
  def up
    execute <<-SQL

      -- Municipios
      UPDATE sip_municipio SET nombre='SAN JOSÉ DE TOLUVIEJO' WHERE id=1336;
      UPDATE sip_municipio SET nombre='SANTA CRUZ DE MOMPOX' WHERE id=787;

      -- Centros poblados
      UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2020.'),  fechadeshabilitacion='2021-12-16'   WHERE id='14067'; -- 5266022 PARCELACIÓN TORRE LUNERA
 UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2020.'),  fechadeshabilitacion='2021-12-16'   WHERE id='6962'; -- 5315011 PUENTE ACACÍAS
 UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2020.'),  fechadeshabilitacion='2021-12-16'   WHERE id='7142'; -- 5543005 TOLDAS
 UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2020.'),  fechadeshabilitacion='2021-12-16'   WHERE id='14113'; -- 5615038 PARCELACIÓN CONJUNTO CAMPESTRE LLANO GRANDE
 UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2020.'),  fechadeshabilitacion='2021-12-16'   WHERE id='14115'; -- 5615040 PARCELACION LAS BRUMAS
 UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2020.'),  fechadeshabilitacion='2021-12-16'   WHERE id='14116'; -- 5615041 PARCELACIÓN LLANOS DE NORMANDÍA
 UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2020.'),  fechadeshabilitacion='2021-12-16'   WHERE id='14117'; -- 5615042 PARCELACION NORMANDIA
 UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2020.'),  fechadeshabilitacion='2021-12-16'   WHERE id='14119'; -- 5615044 PARCELACIÓN SIERRA ALTA
 UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2020.'),  fechadeshabilitacion='2021-12-16'   WHERE id='7337'; -- 5667001 SAN JULIÁN
 UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2020.'),  fechadeshabilitacion='2021-12-16'   WHERE id='14160'; -- 5893020 LA RINCONADA
 UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2020.'),  fechadeshabilitacion='2021-12-16'   WHERE id='14166'; -- 8549004 PUNTA ASTILLEROS
 UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2020.'),  fechadeshabilitacion='2021-12-16'   WHERE id='12540'; -- 8606006 EL PORVENIR (LAS COMPUERTAS)
 UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2020.'),  fechadeshabilitacion='2021-12-16'   WHERE id='14170'; -- 8832014 PUERTO CAIMÁN
 UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2020.'),  fechadeshabilitacion='2021-12-16'   WHERE id='14207'; -- 13654010 CASA DE PIEDRA
 UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2020.'),  fechadeshabilitacion='2021-12-16'   WHERE id='737'; -- 13655002 BERMÚDEZ
 UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2020.'),  fechadeshabilitacion='2021-12-16'   WHERE id='14211'; -- 13673010 PALMARITO
 UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2020.'),  fechadeshabilitacion='2021-12-16'   WHERE id='1174'; -- 15507011 MIRADOR
 UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2020.'),  fechadeshabilitacion='2021-12-16'   WHERE id='1570'; -- 17442007 LA GARRUCHA
 UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2020.'),  fechadeshabilitacion='2021-12-16'   WHERE id='14248'; -- 17495001 KILÓMETRO 40
 UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2020.'),  fechadeshabilitacion='2021-12-16'   WHERE id='1612'; -- 17513014 SAN LORENZO
 UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2020.'),  fechadeshabilitacion='2021-12-16'   WHERE id='14251'; -- 17513015 FILO BONITO
 UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2020.'),  fechadeshabilitacion='2021-12-16'   WHERE id='14269'; -- 18753030 LA CHORRERA
 UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2020.'),  fechadeshabilitacion='2021-12-16'   WHERE id='1897'; -- 18756009 PEÑA ROJA DEL CAGUAN
 UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2020.'),  fechadeshabilitacion='2021-12-16'   WHERE id='1900'; -- 18756010 LA MANÁ
 UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2020.'),  fechadeshabilitacion='2021-12-16'   WHERE id='14274'; -- 18785006 KILÓMETRO 36
 UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2020.'),  fechadeshabilitacion='2021-12-16'   WHERE id='2392'; -- 19418015 SAN ISIDRO
 UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2020.'),  fechadeshabilitacion='2021-12-16'   WHERE id='2397'; -- 19418016 SAN PEDRO DE NAYA
 UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2020.'),  fechadeshabilitacion='2021-12-16'   WHERE id='2386'; -- 19418033 BOCA GRANDE
 UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2020.'),  fechadeshabilitacion='2021-12-16'   WHERE id='14314'; -- 19418037 CASAS VIEJAS
 UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2020.'),  fechadeshabilitacion='2021-12-16'   WHERE id='2969'; -- 20175026 DARDANELOS DOS
 UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2020.'),  fechadeshabilitacion='2021-12-16'   WHERE id='14360'; -- 20175042 PAJARITO
 UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2020.'),  fechadeshabilitacion='2021-12-16'   WHERE id='14383'; -- 23162031 CONDOMINIO LAGOS DE SANTA RITA
 UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2020.'),  fechadeshabilitacion='2021-12-16'   WHERE id='3948'; -- 23672014 EL TRIBUTO
 UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2020.'),  fechadeshabilitacion='2021-12-16'   WHERE id='3976'; -- 23675017 BARCELONA
 UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2020.'),  fechadeshabilitacion='2021-12-16'   WHERE id='4047'; -- 23807034 BONITO VIENTO
 UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2020.'),  fechadeshabilitacion='2021-12-16'   WHERE id='4219'; -- 25040005 BOQUERÓN DE ILO
UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2020.'),  fechadeshabilitacion='2021-12-16'   WHERE id='4331'; -- 25181001 ALTO DEL PALO
 UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2020.'),  fechadeshabilitacion='2021-12-16'   WHERE id='4335'; -- 25183001 EL SISGA
 UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2020.'),  fechadeshabilitacion='2021-12-16'   WHERE id='4434'; -- 25293002 MONTECRISTO
 UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2020.'),  fechadeshabilitacion='2021-12-16'   WHERE id='4456'; -- 25297008 LOS LÓPEZ
 UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2020.'),  fechadeshabilitacion='2021-12-16'   WHERE id='4827'; -- 25815008 SAN CARLOS
 UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2020.'),  fechadeshabilitacion='2021-12-16'   WHERE id='14509'; -- 25899023 SAN GABRIEL
 UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2020.'),  fechadeshabilitacion='2021-12-16'   WHERE id='5042'; -- 27025002 AMPARRADO
 UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2020.'),  fechadeshabilitacion='2021-12-16'   WHERE id='5157'; -- 27150005 TURRIQUITADÓ
 UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2020.'),  fechadeshabilitacion='2021-12-16'   WHERE id='14553'; -- 27425016 SAN FRANCISCO DE TAUCHIGADO
 UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2020.'),  fechadeshabilitacion='2021-12-16'   WHERE id='14557'; -- 27430031 PUERTO CÓRDOBA
 UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2020.'),  fechadeshabilitacion='2021-12-16'   WHERE id='5415'; -- 27615034 CAMPO ALEGRE
 UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2020.'),  fechadeshabilitacion='2021-12-16'   WHERE id='14581'; -- 27745020 PLAYA RICA
 UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2020.'),  fechadeshabilitacion='2021-12-16'   WHERE id='5602'; -- 41001006 ÓRGANOS
 UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2020.'),  fechadeshabilitacion='2021-12-16'   WHERE id='14586'; -- 41001035 SANTA BARBARA
 UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2020.'),  fechadeshabilitacion='2021-12-16'   WHERE id='14604'; -- 44001037 LA GLORIA
 UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2020.'),  fechadeshabilitacion='2021-12-16'   WHERE id='14615'; -- 44090009 RÍO NEGRO
 UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2020.'),  fechadeshabilitacion='2021-12-16'   WHERE id='5999'; -- 44430010 MARAÑAMANA
 UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2020.'),  fechadeshabilitacion='2021-12-16'   WHERE id='6056'; -- 44847024 TAGUAYRA
 UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2020.'),  fechadeshabilitacion='2021-12-16'   WHERE id='14631'; -- 44847026 COMUNIDAD ETDANA
  UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2020.'),  fechadeshabilitacion='2021-12-16'   WHERE id='14635'; -- 44847030 PASADENA
 UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2020.'),  fechadeshabilitacion='2021-12-16'   WHERE id='6317'; -- 47570008 ISLA DE CATAQUITA
 UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2020.'),  fechadeshabilitacion='2021-12-16'   WHERE id='7779'; -- 50330003 BRISAS DEL DUDA
 UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2020.'),  fechadeshabilitacion='2021-12-16'   WHERE id='7790'; -- 50350006 LA CATALINA
 UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2020.'),  fechadeshabilitacion='2021-12-16'   WHERE id='14695'; -- 50350009 ALTO MORROCOY (NUEVO HORIZONTE)
 UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2020.'),  fechadeshabilitacion='2021-12-16'   WHERE id='7852'; -- 50686002 LA CANDELARIA
 UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2020.'),  fechadeshabilitacion='2021-12-16'   WHERE id='8712'; -- 52696016 LAS MARÍAS
 UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2020.'),  fechadeshabilitacion='2021-12-16'   WHERE id='8869'; -- 52835064 PAPAYAL LA PLAYA
 UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2020.'),  fechadeshabilitacion='2021-12-16'   WHERE id='8956'; -- 52835132 MILAGROS
 UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2020.'),  fechadeshabilitacion='2021-12-16'   WHERE id='8933'; -- 52835165 VUELTA DEL GALLO
 UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2020.'),  fechadeshabilitacion='2021-12-16'   WHERE id='8823'; -- 52835192 IMBILI EL GUABO
 UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2020.'),  fechadeshabilitacion='2021-12-16'   WHERE id='8819'; -- 52835195 INGUAPI DEL GUAYABO
 UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2020.'),  fechadeshabilitacion='2021-12-16'   WHERE id='8846'; -- 52835215 SAN FRANCISCO
 UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2020.'),  fechadeshabilitacion='2021-12-16'   WHERE id='8799'; -- 52835225 TRUJILLO
 UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2020.'),  fechadeshabilitacion='2021-12-16'   WHERE id='9176'; -- 54206001 BALCONES
 UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2020.'),  fechadeshabilitacion='2021-12-16'   WHERE id='9170'; -- 54206014 HONDURAS LA MOTILONA
 UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2020.'),  fechadeshabilitacion='2021-12-16'   WHERE id='15304'; -- 54223005 SAN MIGUEL
 UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2020.'),  fechadeshabilitacion='2021-12-16'   WHERE id='9582'; -- 63548001 BARRAGÁN
 UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2020.'),  fechadeshabilitacion='2021-12-16'   WHERE id='9722'; -- 66170012 GAITÁN
  UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2020.'),  fechadeshabilitacion='2021-12-16'   WHERE id='9731'; -- 66170013 LA DIVISA
 UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2020.'),  fechadeshabilitacion='2021-12-16'   WHERE id='10683'; -- 70204004 EL CERRO
 UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2020.'),  fechadeshabilitacion='2021-12-16'   WHERE id='14976'; -- 70508032 ALMAGRA SECTOR LAS PASAS
 UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2020.'),  fechadeshabilitacion='2021-12-16'   WHERE id='10879'; -- 70678006 LOS ÁNGELES
 UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2020.'),  fechadeshabilitacion='2021-12-16'   WHERE id='14992'; -- 70708022 CUATRO BOCAS
 UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2020.'),  fechadeshabilitacion='2021-12-16'   WHERE id='15009'; -- 70717010 RANCHO LARGO
 UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2020.'),  fechadeshabilitacion='2021-12-16'   WHERE id='11102'; -- 73001026 CHARCO RICO
 UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2020.'),  fechadeshabilitacion='2021-12-16'   WHERE id='11738'; -- 76109052 CALLE LARGA
 UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2020.'),  fechadeshabilitacion='2021-12-16'   WHERE id='11748'; -- 76109072 SAN JOAQUÍN
 UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2020.'),  fechadeshabilitacion='2021-12-16'   WHERE id='11725'; -- 76109101  LAS PALMAS
 UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2020.'),  fechadeshabilitacion='2021-12-16'   WHERE id='11719'; -- 76109105 PITAL
 UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2020.'),  fechadeshabilitacion='2021-12-16'   WHERE id='11694'; -- 76109114 CALLE LARGA - RIO MAYORQUIN
 UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2020.'),  fechadeshabilitacion='2021-12-16'   WHERE id='15074'; -- 76364035 LA CÁRCEL
 UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2020.'),  fechadeshabilitacion='2021-12-16'   WHERE id='12223'; -- 76563019 SAN ISIDRO
 UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2020.'),  fechadeshabilitacion='2021-12-16'   WHERE id='12633'; -- 81065003 LOS ANGELITOS
 UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2020.'),  fechadeshabilitacion='2021-12-16'   WHERE id='15107'; -- 81736015 PUERTO SALCEDO
 UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2020.'),  fechadeshabilitacion='2021-12-16'   WHERE id='15108'; -- 81736016 QUESQUALITO
 UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2020.'),  fechadeshabilitacion='2021-12-16'   WHERE id='12718'; -- 85010011 TURUA
 UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2020.'),  fechadeshabilitacion='2021-12-16'   WHERE id='12834'; -- 85430002 GUAMAL
 UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2020.'),  fechadeshabilitacion='2021-12-16'   WHERE id='15173'; -- 91540016 SANTAREN
 UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2020.'),  fechadeshabilitacion='2021-12-16'   WHERE id='15187'; -- 95001041 TIENDA NUEVA
 UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2020.'),  fechadeshabilitacion='2021-12-16'   WHERE id='13130'; -- 97001001 BOCAS DE QUERARÍ
 UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2020.'),  fechadeshabilitacion='2021-12-16'   WHERE id='13128'; -- 97001003 MACUANA
 UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2020.'),  fechadeshabilitacion='2021-12-16'   WHERE id='13131'; -- 97001004 TRINIDAD DEL TIQUIÉ

 -- Nuevos centros poblados
 INSERT INTO sip_clase (id, id_municipio, nombre, id_clalocal, observaciones, fechacreacion, created_at, updated_at)VALUES (15400, 192, 'MORALES', 51, 'Aparece en DIVIPOLA 2020', '2021-12-16', '2021-12-16', '2021-12-16');
  INSERT INTO sip_clase (id, id_municipio, id_clalocal, nombre, observaciones, fechacreacion, created_at, updated_at)VALUES (15401, 972, 7, 'CERROPETRONA', 'Aparece en DIVIPOLA 2020', '2021-12-16', '2021-12-16', '2021-12-16');
   INSERT INTO sip_clase (id, id_municipio, nombre, id_clalocal, observaciones, fechacreacion, created_at, updated_at)VALUES (15402, 383, 'MACAS', 1, 'Aparece en DIVIPOLA 2020', '2021-12-16', '2021-12-16', '2021-12-16');
    INSERT INTO sip_clase (id, id_municipio, nombre, id_clalocal, observaciones, fechacreacion, created_at, updated_at)VALUES (15403, 51, 'LA CATALINA', 46, 'Aparece en DIVIPOLA 2020', '2021-12-16', '2021-12-16', '2021-12-16');

    UPDATE sip_clase SET nombre='LA PRIMAVERA SANTA CRUZ' WHERE id = 6721;
    UPDATE sip_clase SET nombre='SANTA CRUZ DE MOMPOX, DISTRITO ESPECIAL, TURÍSTICO, CULTURAL E HISTÓRICO' WHERE id = 633;
    UPDATE sip_clase SET nombre='BARRANCABERMEJA, DISTRITO ESPECIAL, PORTUARIO, BIODIVERSO, INDUSTRIAL Y TURÍSTICO' WHERE id = 9899;
    UPDATE sip_clase SET nombre='LIMONES' WHERE id = 11724;
    UPDATE sip_clase SET nombre='PUERTO ZANCUDO' WHERE id = 15306;


    SQL
  end
  
  def down
    execute <<-SQL
      UPDATE sip_municipio SET nombre='SAN JOSÉ DE TOLUVIEJO (TOLÚ VIEJO)' WHERE id=1336;
      UPDATE sip_municipio SET nombre='SANTA CRUZ DE MOMPÓX' WHERE id=787;

      UPDATE sip_clase SET fechadeshabilitacion=NULL   WHERE id='14067'; -- 5266022 PARCELACIÓN TORRE LUNERA
 UPDATE sip_clase SET fechadeshabilitacion=NULL   WHERE id='6962'; -- 5315011 PUENTE ACACÍAS
 UPDATE sip_clase SET fechadeshabilitacion=NULL   WHERE id='7142'; -- 5543005 TOLDAS
 UPDATE sip_clase SET fechadeshabilitacion=NULL   WHERE id='14113'; -- 5615038 PARCELACIÓN CONJUNTO CAMPESTRE LLANO GRANDE
 UPDATE sip_clase SET fechadeshabilitacion=NULL   WHERE id='14115'; -- 5615040 PARCELACION LAS BRUMAS
 UPDATE sip_clase SET fechadeshabilitacion=NULL   WHERE id='14116'; -- 5615041 PARCELACIÓN LLANOS DE NORMANDÍA
 UPDATE sip_clase SET fechadeshabilitacion=NULL   WHERE id='14117'; -- 5615042 PARCELACION NORMANDIA
 UPDATE sip_clase SET fechadeshabilitacion=NULL   WHERE id='14119'; -- 5615044 PARCELACIÓN SIERRA ALTA
 UPDATE sip_clase SET fechadeshabilitacion=NULL   WHERE id='7337'; -- 5667001 SAN JULIÁN
 UPDATE sip_clase SET fechadeshabilitacion=NULL   WHERE id='14160'; -- 5893020 LA RINCONADA
 UPDATE sip_clase SET fechadeshabilitacion=NULL   WHERE id='14166'; -- 8549004 PUNTA ASTILLEROS
 UPDATE sip_clase SET fechadeshabilitacion=NULL   WHERE id='12540'; -- 8606006 EL PORVENIR (LAS COMPUERTAS)
 UPDATE sip_clase SET fechadeshabilitacion=NULL   WHERE id='14170'; -- 8832014 PUERTO CAIMÁN
 UPDATE sip_clase SET fechadeshabilitacion=NULL   WHERE id='14207'; -- 13654010 CASA DE PIEDRA
 UPDATE sip_clase SET fechadeshabilitacion=NULL   WHERE id='737'; -- 13655002 BERMÚDEZ
 UPDATE sip_clase SET fechadeshabilitacion=NULL   WHERE id='14211'; -- 13673010 PALMARITO
 UPDATE sip_clase SET fechadeshabilitacion=NULL   WHERE id='1174'; -- 15507011 MIRADOR
 UPDATE sip_clase SET fechadeshabilitacion=NULL   WHERE id='1570'; -- 17442007 LA GARRUCHA
 UPDATE sip_clase SET fechadeshabilitacion=NULL   WHERE id='14248'; -- 17495001 KILÓMETRO 40
 UPDATE sip_clase SET fechadeshabilitacion=NULL   WHERE id='1612'; -- 17513014 SAN LORENZO
 UPDATE sip_clase SET fechadeshabilitacion=NULL   WHERE id='14251'; -- 17513015 FILO BONITO
 UPDATE sip_clase SET fechadeshabilitacion=NULL   WHERE id='14269'; -- 18753030 LA CHORRERA
 UPDATE sip_clase SET fechadeshabilitacion=NULL   WHERE id='1897'; -- 18756009 PEÑA ROJA DEL CAGUAN
 UPDATE sip_clase SET fechadeshabilitacion=NULL   WHERE id='1900'; -- 18756010 LA MANÁ
 UPDATE sip_clase SET fechadeshabilitacion=NULL   WHERE id='14274'; -- 18785006 KILÓMETRO 36
 UPDATE sip_clase SET fechadeshabilitacion=NULL   WHERE id='2392'; -- 19418015 SAN ISIDRO
 UPDATE sip_clase SET fechadeshabilitacion=NULL   WHERE id='2397'; -- 19418016 SAN PEDRO DE NAYA
 UPDATE sip_clase SET fechadeshabilitacion=NULL   WHERE id='2386'; -- 19418033 BOCA GRANDE
 UPDATE sip_clase SET fechadeshabilitacion=NULL   WHERE id='14314'; -- 19418037 CASAS VIEJAS
 UPDATE sip_clase SET fechadeshabilitacion=NULL   WHERE id='2969'; -- 20175026 DARDANELOS DOS
 UPDATE sip_clase SET fechadeshabilitacion=NULL   WHERE id='14360'; -- 20175042 PAJARITO
 UPDATE sip_clase SET fechadeshabilitacion=NULL   WHERE id='14383'; -- 23162031 CONDOMINIO LAGOS DE SANTA RITA
 UPDATE sip_clase SET fechadeshabilitacion=NULL   WHERE id='3948'; -- 23672014 EL TRIBUTO
 UPDATE sip_clase SET fechadeshabilitacion=NULL   WHERE id='3976'; -- 23675017 BARCELONA
 UPDATE sip_clase SET fechadeshabilitacion=NULL   WHERE id='4047'; -- 23807034 BONITO VIENTO
 UPDATE sip_clase SET fechadeshabilitacion=NULL   WHERE id='4219'; -- 25040005 BOQUERÓN DE ILO
UPDATE sip_clase SET fechadeshabilitacion=NULL   WHERE id='4331'; -- 25181001 ALTO DEL PALO
 UPDATE sip_clase SET fechadeshabilitacion=NULL   WHERE id='4335'; -- 25183001 EL SISGA
 UPDATE sip_clase SET fechadeshabilitacion=NULL   WHERE id='4434'; -- 25293002 MONTECRISTO
 UPDATE sip_clase SET fechadeshabilitacion=NULL   WHERE id='4456'; -- 25297008 LOS LÓPEZ
 UPDATE sip_clase SET fechadeshabilitacion=NULL   WHERE id='4827'; -- 25815008 SAN CARLOS
 UPDATE sip_clase SET fechadeshabilitacion=NULL   WHERE id='14509'; -- 25899023 SAN GABRIEL
 UPDATE sip_clase SET fechadeshabilitacion=NULL   WHERE id='5042'; -- 27025002 AMPARRADO
 UPDATE sip_clase SET fechadeshabilitacion=NULL   WHERE id='5157'; -- 27150005 TURRIQUITADÓ
 UPDATE sip_clase SET fechadeshabilitacion=NULL   WHERE id='14553'; -- 27425016 SAN FRANCISCO DE TAUCHIGADO
 UPDATE sip_clase SET fechadeshabilitacion=NULL   WHERE id='14557'; -- 27430031 PUERTO CÓRDOBA
 UPDATE sip_clase SET fechadeshabilitacion=NULL   WHERE id='5415'; -- 27615034 CAMPO ALEGRE
 UPDATE sip_clase SET fechadeshabilitacion=NULL   WHERE id='14581'; -- 27745020 PLAYA RICA
 UPDATE sip_clase SET fechadeshabilitacion=NULL   WHERE id='5602'; -- 41001006 ÓRGANOS
 UPDATE sip_clase SET fechadeshabilitacion=NULL   WHERE id='14586'; -- 41001035 SANTA BARBARA
 UPDATE sip_clase SET fechadeshabilitacion=NULL   WHERE id='14604'; -- 44001037 LA GLORIA
 UPDATE sip_clase SET fechadeshabilitacion=NULL   WHERE id='14615'; -- 44090009 RÍO NEGRO
 UPDATE sip_clase SET fechadeshabilitacion=NULL   WHERE id='5999'; -- 44430010 MARAÑAMANA
 UPDATE sip_clase SET fechadeshabilitacion=NULL   WHERE id='6056'; -- 44847024 TAGUAYRA
 UPDATE sip_clase SET fechadeshabilitacion=NULL   WHERE id='14631'; -- 44847026 COMUNIDAD ETDANA
  UPDATE sip_clase SET fechadeshabilitacion=NULL   WHERE id='14635'; -- 44847030 PASADENA
 UPDATE sip_clase SET fechadeshabilitacion=NULL   WHERE id='6317'; -- 47570008 ISLA DE CATAQUITA
 UPDATE sip_clase SET fechadeshabilitacion=NULL   WHERE id='7779'; -- 50330003 BRISAS DEL DUDA
 UPDATE sip_clase SET fechadeshabilitacion=NULL   WHERE id='7790'; -- 50350006 LA CATALINA
 UPDATE sip_clase SET fechadeshabilitacion=NULL   WHERE id='14695'; -- 50350009 ALTO MORROCOY (NUEVO HORIZONTE)
 UPDATE sip_clase SET fechadeshabilitacion=NULL   WHERE id='7852'; -- 50686002 LA CANDELARIA
 UPDATE sip_clase SET fechadeshabilitacion=NULL   WHERE id='8712'; -- 52696016 LAS MARÍAS
 UPDATE sip_clase SET fechadeshabilitacion=NULL   WHERE id='8869'; -- 52835064 PAPAYAL LA PLAYA
 UPDATE sip_clase SET fechadeshabilitacion=NULL   WHERE id='8956'; -- 52835132 MILAGROS
 UPDATE sip_clase SET fechadeshabilitacion=NULL   WHERE id='8933'; -- 52835165 VUELTA DEL GALLO
 UPDATE sip_clase SET fechadeshabilitacion=NULL   WHERE id='8823'; -- 52835192 IMBILI EL GUABO
 UPDATE sip_clase SET fechadeshabilitacion=NULL   WHERE id='8819'; -- 52835195 INGUAPI DEL GUAYABO
 UPDATE sip_clase SET fechadeshabilitacion=NULL   WHERE id='8846'; -- 52835215 SAN FRANCISCO
 UPDATE sip_clase SET fechadeshabilitacion=NULL   WHERE id='8799'; -- 52835225 TRUJILLO
 UPDATE sip_clase SET fechadeshabilitacion=NULL   WHERE id='9176'; -- 54206001 BALCONES
 UPDATE sip_clase SET fechadeshabilitacion=NULL   WHERE id='9170'; -- 54206014 HONDURAS LA MOTILONA
 UPDATE sip_clase SET fechadeshabilitacion=NULL   WHERE id='15304'; -- 54223005 SAN MIGUEL
 UPDATE sip_clase SET fechadeshabilitacion=NULL   WHERE id='9582'; -- 63548001 BARRAGÁN
 UPDATE sip_clase SET fechadeshabilitacion=NULL   WHERE id='9722'; -- 66170012 GAITÁN
  UPDATE sip_clase SET fechadeshabilitacion=NULL   WHERE id='9731'; -- 66170013 LA DIVISA
 UPDATE sip_clase SET fechadeshabilitacion=NULL   WHERE id='10683'; -- 70204004 EL CERRO
 UPDATE sip_clase SET fechadeshabilitacion=NULL   WHERE id='14976'; -- 70508032 ALMAGRA SECTOR LAS PASAS
 UPDATE sip_clase SET fechadeshabilitacion=NULL   WHERE id='10879'; -- 70678006 LOS ÁNGELES
 UPDATE sip_clase SET fechadeshabilitacion=NULL   WHERE id='14992'; -- 70708022 CUATRO BOCAS
 UPDATE sip_clase SET fechadeshabilitacion=NULL   WHERE id='15009'; -- 70717010 RANCHO LARGO
 UPDATE sip_clase SET fechadeshabilitacion=NULL   WHERE id='11102'; -- 73001026 CHARCO RICO
 UPDATE sip_clase SET fechadeshabilitacion=NULL   WHERE id='11738'; -- 76109052 CALLE LARGA
 UPDATE sip_clase SET fechadeshabilitacion=NULL   WHERE id='11748'; -- 76109072 SAN JOAQUÍN
 UPDATE sip_clase SET fechadeshabilitacion=NULL   WHERE id='11725'; -- 76109101  LAS PALMAS
 UPDATE sip_clase SET fechadeshabilitacion=NULL   WHERE id='11719'; -- 76109105 PITAL
 UPDATE sip_clase SET fechadeshabilitacion=NULL   WHERE id='11694'; -- 76109114 CALLE LARGA - RIO MAYORQUIN
 UPDATE sip_clase SET fechadeshabilitacion=NULL   WHERE id='15074'; -- 76364035 LA CÁRCEL
 UPDATE sip_clase SET fechadeshabilitacion=NULL   WHERE id='12223'; -- 76563019 SAN ISIDRO
 UPDATE sip_clase SET fechadeshabilitacion=NULL   WHERE id='12633'; -- 81065003 LOS ANGELITOS
 UPDATE sip_clase SET fechadeshabilitacion=NULL   WHERE id='15107'; -- 81736015 PUERTO SALCEDO
 UPDATE sip_clase SET fechadeshabilitacion=NULL   WHERE id='15108'; -- 81736016 QUESQUALITO
 UPDATE sip_clase SET fechadeshabilitacion=NULL   WHERE id='12718'; -- 85010011 TURUA
 UPDATE sip_clase SET fechadeshabilitacion=NULL   WHERE id='12834'; -- 85430002 GUAMAL
 UPDATE sip_clase SET fechadeshabilitacion=NULL   WHERE id='15173'; -- 91540016 SANTAREN
 UPDATE sip_clase SET fechadeshabilitacion=NULL   WHERE id='15187'; -- 95001041 TIENDA NUEVA
 UPDATE sip_clase SET fechadeshabilitacion=NULL   WHERE id='13130'; -- 97001001 BOCAS DE QUERARÍ
 UPDATE sip_clase SET fechadeshabilitacion=NULL   WHERE id='13128'; -- 97001003 MACUANA
 UPDATE sip_clase SET fechadeshabilitacion=NULL   WHERE id='13131'; -- 97001004 TRINIDAD DEL TIQUIÉ

UPDATE sip_clase SET nombre='LA PRIMAVERA SANTA CRUZ' WHERE id = 6721;
    UPDATE sip_clase SET nombre='SANTA CRUZ DE MOMPOX, DISTRITO ESPECIAL, TURÍSTICO, CULTURAL E HISTÓRICO' WHERE id = 633;
    UPDATE sip_clase SET nombre='BARRANCABERMEJA, DISTRITO ESPECIAL, PORTUARIO, BIODIVERSO, INDUSTRIAL Y TURÍSTICO' WHERE id = 9899;
    UPDATE sip_clase SET nombre='LIMONES' WHERE id = 11724;
    UPDATE sip_clase SET nombre='PUERTO ZANCUDO' WHERE id = 15306;


  DELETE FROM sip_clase WHERE id>=15400 AND id<=15403;

UPDATE sip_clase SET nombre='LA PRIMAVERA' WHERE id = 6721;
    UPDATE sip_clase SET nombre='SANTA CRUZ DE MOMPÓX, DISTRITO ESPECIAL, TURÍSTICO, CULTURAL E HISTÓRICO' WHERE id = 633;
    UPDATE sip_clase SET nombre='BARRANCABERMEJA' WHERE id = 9899;
    UPDATE sip_clase SET nombre='LOS LIMONES' WHERE id = 11724;
    UPDATE sip_clase SET nombre='PUERTO ZANCUDO*' WHERE id = 15306;

    SQL
  end
end
