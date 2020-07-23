class ActualizaDivipola2019 < ActiveRecord::Migration[6.0]
  def up
    execute <<-SQL
      CREATE OR REPLACE FUNCTION completa_obs(obs VARCHAR, 
        nuevaobs VARCHAR) RETURNS VARCHAR AS $$
      BEGIN
        RETURN CASE WHEN obs IS NULL THEN nuevaobs
          WHEN obs='' THEN nuevaobs
          WHEN RIGHT(obs, 1)='.' THEN obs || ' ' || nuevaobs
          ELSE obs || '. ' || nuevaobs
        END;
      END; $$
      LANGUAGE PLPGSQL;
        
      UPDATE sip_clase SET nombre='LOS LIMONES',
        observaciones=completa_obs(observaciones, 'Centro poblado cambiado en revisión de DIVIPOLA 2019. Antes era EL LIMONES')
        WHERE id=11724; 
      UPDATE sip_departamento SET nombre='QUINDÍO', 
        observaciones=completa_obs(observaciones, 'Departamento cambiado en revisión de DIVIPOLA 2019. Antes era QUINDIO')
        WHERE id_deplocal=63;
      UPDATE sip_departamento SET nombre='BOGOTÁ, D.C.', 
        observaciones=completa_obs(observaciones, 'Departamento cambiado en revisión de DIVIPOLA 2019. Antes era BOGOTÁ D.C.')
        WHERE id_deplocal=11;
      UPDATE sip_municipio SET fechadeshabilitacion='2020-07-22',
        observaciones=completa_obs(observaciones, 'Municipio deshabilitado en DIVIPOLA 2019')
        WHERE id=1079; -- MAPIRIPANA (2 centros poblados 13067 PUERTO ZANCUDO 94663001 y MAPIRIPANA 94663000)
      UPDATE sip_clase SET fechadeshabilitacion='2020-07-22',
        observaciones=completa_obs(observaciones, 'Centro poblado deshabilitado en DIVIPOLA 2019')
        WHERE id=13067; -- PUERTO ZANCUDO (94663001 de MAPIRIPANA)
      UPDATE sip_clase SET fechadeshabilitacion='2020-07-22',
        observaciones=completa_obs(observaciones, 'Centro poblado deshabilitado en DIVIPOLA 2019')
        WHERE id=13068; -- MAPIRIPANA (94663000 de MAPIRIPANA)

      UPDATE sip_municipio SET nombre='SANTA CRUZ DE MOMPÓX',
        observaciones=completa_obs(observaciones, 'Municipio con nombre cambiado durante revisión de DIVIPOLA 2019. Antes era SANTA CRUZ DE MOMPÓX (MOMPÓS)')
        WHERE id=787;
      UPDATE sip_municipio SET nombre='SANTA CRUZ DE MOMPÓX',
        observaciones=completa_obs(observaciones, 'Centro poblado con nombre cambiado durante revisión de DIVIPOLA 2019. Antes era SANTA CRUZ DE MOMPÓX (MOMPÓS)')
        WHERE id=787;
      UPDATE sip_municipio SET nombre='SAN JACINTO DEL CAUCA',
        observaciones=completa_obs(observaciones, 'Centro poblado con nombre cambiado durante revisión de DIVIPOLA 2019. Antes era SAN JACINTO public.DEL CAUCA')
	      WHERE id=1064;
      UPDATE sip_municipio SET nombre='GUAPI',
        observaciones=completa_obs(observaciones, 'Centro poblado con nombre cambiado durante revisión de DIVIPOLA 2019. Antes era GUAPÍ')
	      WHERE id=566;
      UPDATE sip_municipio SET nombre='SOTARÁ - PAISPAMBA',
        observaciones=completa_obs(observaciones, 'Centro poblado con nombre cambiado durante revisión de DIVIPOLA 2019. Antes era SOTARA')
        WHERE id=1230;
      UPDATE sip_municipio SET nombre='ANCUYA',
        observaciones=completa_obs(observaciones, 'Centro poblado con nombre cambiado durante revisión de DIVIPOLA 2019. Antes era ANCUYÁ')
        WHERE id=614;
      UPDATE sip_municipio SET nombre='CUASPUD CARLOSAMA',
        observaciones=completa_obs(observaciones, 'Centro poblado con nombre cambiado durante revisión de DIVIPOLA 2019. Antes era CUASPÚD')
        WHERE id=383;
      UPDATE sip_municipio SET nombre='SAN JOSÉ DE TOLUVIEJO (TOLÚ VIEJO)',
        observaciones=completa_obs(observaciones, 'Centro poblado con nombre cambiado durante revisión de DIVIPOLA 2019. Antes era TOLÚ VIEJO')
        WHERE id=1336;
      UPDATE sip_municipio SET nombre='ARMERO',
        observaciones=completa_obs(observaciones, 'Centro poblado con nombre cambiado durante revisión de DIVIPOLA 2019. Antes era ARMERO (ARMERO GUAYABAL)')
        WHERE id=923;
      UPDATE sip_municipio SET nombre='BARRANCOMINAS',
        observaciones=completa_obs(observaciones, 'Centro poblado con nombre cambiado durante revisión de DIVIPOLA 2019. Antes era BARRANCO MINAS')
        WHERE id=594;


      UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2019.'),  fechadeshabilitacion='2020-07-23'   WHERE id='14023'; -- 5129014 LA CORRALITA
      UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2019.'),  fechadeshabilitacion='2020-07-23'   WHERE id='7045'; -- 5380022 LA VIRGEN PARTE ALTA
      UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2019.'),  fechadeshabilitacion='2020-07-23'   WHERE id='14089'; -- 5490017 VALE PAVA
      UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2019.'),  fechadeshabilitacion='2020-07-23'   WHERE id='7229'; -- 5631014 PLAYAS PLACER
      UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2019.'),  fechadeshabilitacion='2020-07-23'   WHERE id='7290'; -- 5656004 LLANOS DE AGUIRRE
      UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2019.'),  fechadeshabilitacion='2020-07-23'   WHERE id='7291'; -- 5656010 EL CALVARIO
      UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2019.'),  fechadeshabilitacion='2020-07-23'   WHERE id='7495'; -- 5837015 BOBAL
      UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2019.'),  fechadeshabilitacion='2020-07-23'   WHERE id='7553'; -- 5861011 LA MINA
      UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2019.'),  fechadeshabilitacion='2020-07-23'   WHERE id='14183'; -- 13006044 CORONCORO
      UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2019.'),  fechadeshabilitacion='2020-07-23'   WHERE id='548'; -- 13440015 EL BARRANCO
      UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2019.'),  fechadeshabilitacion='2020-07-23'   WHERE id='551'; -- 13440018 LOS MANGOS
      UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2019.'),  fechadeshabilitacion='2020-07-23'   WHERE id='543'; -- 13440019 SANDOVALITO
      UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2019.'),  fechadeshabilitacion='2020-07-23'   WHERE id='689'; -- 13549029 RUFINA PUERTO NUEVO
      UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2019.'),  fechadeshabilitacion='2020-07-23'   WHERE id='714'; -- 13650011 EL GATO
      UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2019.'),  fechadeshabilitacion='2020-07-23'   WHERE id='792'; -- 13688014 ARRAYANES
      UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2019.'),  fechadeshabilitacion='2020-07-23'   WHERE id='826'; -- 13810001 AGUAS NEGRAS
      UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2019.'),  fechadeshabilitacion='2020-07-23'   WHERE id='835'; -- 13810007 PALMA ESTERAL
      UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2019.'),  fechadeshabilitacion='2020-07-23'   WHERE id='927'; -- 15047006 SUSE
      UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2019.'),  fechadeshabilitacion='2020-07-23'   WHERE id='929'; -- 15047011 HATO LAGUNA
      UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2019.'),  fechadeshabilitacion='2020-07-23'   WHERE id='928'; -- 15047015 QUEBRADAS
      UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2019.'),  fechadeshabilitacion='2020-07-23'   WHERE id='1152'; -- 15469008 LOS SAUCES
      UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2019.'),  fechadeshabilitacion='2020-07-23'   WHERE id='14228'; -- 15480004 MATA DE CAFÉ
      UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2019.'),  fechadeshabilitacion='2020-07-23'   WHERE id='14229'; -- 15507012 EL OASIS
      UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2019.'),  fechadeshabilitacion='2020-07-23'   WHERE id='1825'; -- 18247006 EL BERLÍN
      UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2019.'),  fechadeshabilitacion='2020-07-23'   WHERE id='14362'; -- 20250007 PUERTO LAJAS
      UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2019.'),  fechadeshabilitacion='2020-07-23'   WHERE id='3891'; -- 23660055 LAS CUMBRES
      UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2019.'),  fechadeshabilitacion='2020-07-23'   WHERE id='4404'; -- 25281004 EL RAMAL
      UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2019.'),  fechadeshabilitacion='2020-07-23'   WHERE id='4463'; -- 25307008 GUABINAL CERRO
      UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2019.'),  fechadeshabilitacion='2020-07-23'   WHERE id='4631'; -- 25518003 EL PLOMO (EL PARAÍSO)
      UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2019.'),  fechadeshabilitacion='2020-07-23'   WHERE id='4866'; -- 25843012 VIENTO LIBRE - LAS BRISAS
      UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2019.'),  fechadeshabilitacion='2020-07-23'   WHERE id='14505'; -- 25843013 APARTADERO
      UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2019.'),  fechadeshabilitacion='2020-07-23'   WHERE id='4948'; -- 25899016 LOTEO BANOY
      UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2019.'),  fechadeshabilitacion='2020-07-23'   WHERE id='5736'; -- 41359005 LOS ARRAYANES
      UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2019.'),  fechadeshabilitacion='2020-07-23'   WHERE id='5860'; -- 41799006 EL CEDRAL
      UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2019.'),  fechadeshabilitacion='2020-07-23'   WHERE id='6337'; -- 47660015 PARAPETO
      UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2019.'),  fechadeshabilitacion='2020-07-23'   WHERE id='7682'; -- 50001030 QUINTAS DEL DIAMANTE
      UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2019.'),  fechadeshabilitacion='2020-07-23'   WHERE id='7684'; -- 50001032 SECTOR LOS ALGARROBOS - NARANJOS
      UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2019.'),  fechadeshabilitacion='2020-07-23'   WHERE id='7681'; -- 50001033 SECTOR VIGÍA SEBASTOPOL
      UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2019.'),  fechadeshabilitacion='2020-07-23'   WHERE id='8636'; -- 52678001 ANDALUCÍA
      UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2019.'),  fechadeshabilitacion='2020-07-23'   WHERE id='8618'; -- 52678004 DECIO
      UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2019.'),  fechadeshabilitacion='2020-07-23'   WHERE id='8623'; -- 52678005 LA PLANADA
      UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2019.'),  fechadeshabilitacion='2020-07-23'   WHERE id='8624'; -- 52678019 EL SALTO
      UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2019.'),  fechadeshabilitacion='2020-07-23'   WHERE id='8627'; -- 52678023 BETANIA
      UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2019.'),  fechadeshabilitacion='2020-07-23'   WHERE id='8647'; -- 52683006 LOMA
      UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2019.'),  fechadeshabilitacion='2020-07-23'   WHERE id='8659'; -- 52683015 BALCON ALTO
      UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2019.'),  fechadeshabilitacion='2020-07-23'   WHERE id='8653'; -- 52683020 PLAN INGENIO
      UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2019.'),  fechadeshabilitacion='2020-07-23'   WHERE id='8648'; -- 52683021 SAN ANDRÉS
      UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2019.'),  fechadeshabilitacion='2020-07-23'   WHERE id='8665'; -- 52683025 CRUZ ARADA
      UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2019.'),  fechadeshabilitacion='2020-07-23'   WHERE id='8656'; -- 52683026 MUNDO LOMA
      UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2019.'),  fechadeshabilitacion='2020-07-23'   WHERE id='9129'; -- 54099003 MONTERREDONDO
      UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2019.'),  fechadeshabilitacion='2020-07-23'   WHERE id='14812'; -- 54670019 LAS JUNTAS
      UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2019.'),  fechadeshabilitacion='2020-07-23'   WHERE id='9552'; -- 63190027 LOS PINOS
      UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2019.'),  fechadeshabilitacion='2020-07-23'   WHERE id='9536'; -- 63190029 SAN ANTONIO
      UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2019.'),  fechadeshabilitacion='2020-07-23'   WHERE id='14900'; -- 68377006 EL LIBANO
      UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2019.'),  fechadeshabilitacion='2020-07-23'   WHERE id='10717'; -- 70230002 ALEMANIA
      UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2019.'),  fechadeshabilitacion='2020-07-23'   WHERE id='14953'; -- 70230005 HONEY
      UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2019.'),  fechadeshabilitacion='2020-07-23'   WHERE id='14962'; -- 70418009 BAJO DE LA ALEGRIA
      UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2019.'),  fechadeshabilitacion='2020-07-23'   WHERE id='11177'; -- 73067015 LA CEJA (MESITAS)
      UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2019.'),  fechadeshabilitacion='2020-07-23'   WHERE id='11670'; -- 76100004 DOSQUEBRADAS
      UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2019.'),  fechadeshabilitacion='2020-07-23'   WHERE id='11669'; -- 76100018 CRISTALES
      UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2019.'),  fechadeshabilitacion='2020-07-23'   WHERE id='11882'; -- 76130043 VUELTA DE SAN DIEGO
      UPDATE sip_clase SET observaciones=completa_obs(observaciones, 'No está en DIVIPOLA 2019.'),  fechadeshabilitacion='2020-07-23'   WHERE id='11879'; -- 76130044 ZAINERA

      -- Rehabilitados

      UPDATE sip_clase SET fechadeshabilitacion=NULL, observaciones=completa_obs(observaciones, 'Rehabilitado por DIVIPOLA 2019 el 2020-07-23.') WHERE id='6909'; -- 5284001 CARAUTA
      UPDATE sip_clase SET fechadeshabilitacion=NULL, observaciones=completa_obs(observaciones, 'Rehabilitado por DIVIPOLA 2019 el 2020-07-23.') WHERE id='1299'; -- 15693002 EL IMPERIO
      UPDATE sip_clase SET fechadeshabilitacion=NULL, observaciones=completa_obs(observaciones, 'Rehabilitado por DIVIPOLA 2019 el 2020-07-23.') WHERE id='1319'; -- 15757000 SOCHA
      UPDATE sip_clase SET fechadeshabilitacion=NULL, observaciones=completa_obs(observaciones, 'Rehabilitado por DIVIPOLA 2019 el 2020-07-23.') WHERE id='3890'; -- 23660024 LOS BARRILES
      UPDATE sip_clase SET fechadeshabilitacion=NULL, observaciones=completa_obs(observaciones, 'Rehabilitado por DIVIPOLA 2019 el 2020-07-23.') WHERE id='4335'; -- 25183001 EL SISGA
      UPDATE sip_clase SET fechadeshabilitacion=NULL, observaciones=completa_obs(observaciones, 'Rehabilitado por DIVIPOLA 2019 el 2020-07-23.') WHERE id='6407'; -- 47745001 BUENAVISTA
      UPDATE sip_clase SET fechadeshabilitacion=NULL, observaciones=completa_obs(observaciones, 'Rehabilitado por DIVIPOLA 2019 el 2020-07-23.') WHERE id='6402'; -- 47745002 NUEVA VENECIA
      UPDATE sip_clase SET fechadeshabilitacion=NULL, observaciones=completa_obs(observaciones, 'Rehabilitado por DIVIPOLA 2019 el 2020-07-23.') WHERE id='7923'; -- 52001058 EL ROSARIO
      UPDATE sip_clase SET fechadeshabilitacion=NULL, observaciones=completa_obs(observaciones, 'Rehabilitado por DIVIPOLA 2019 el 2020-07-23.') WHERE id='7892'; -- 52001087 LA CALDERA
      UPDATE sip_clase SET fechadeshabilitacion=NULL, observaciones=completa_obs(observaciones, 'Rehabilitado por DIVIPOLA 2019 el 2020-07-23.') WHERE id='11716'; -- 76109044 CABECERA RÍO SAN JUAN
      UPDATE sip_clase SET fechadeshabilitacion=NULL, observaciones=completa_obs(observaciones, 'Rehabilitado por DIVIPOLA 2019 el 2020-07-23.') WHERE id='12427'; -- 76890003 JIGUALES


      -- Rehabilita 2
      UPDATE sip_clase SET fechadeshabilitacion=NULL, nombre='LA CORRALITA',  observaciones=completa_obs(observaciones, 'Rehabilitado por DIVIPOLA 2019 el 2020-07-23, nombre anterior: LA CORRALA.') WHERE id='6726'; -- 5129005
      UPDATE sip_clase SET fechadeshabilitacion=NULL, nombre='LA PRIMAVERA',  observaciones=completa_obs(observaciones, 'Rehabilitado por DIVIPOLA 2019 el 2020-07-23, nombre anterior: PRIMAVERA.') WHERE id='6721'; -- 5129006
      UPDATE sip_clase SET fechadeshabilitacion=NULL, nombre='PUENTE ACACÍAS',  observaciones=completa_obs(observaciones, 'Rehabilitado por DIVIPOLA 2019 el 2020-07-23, nombre anterior: PUENTE ACACIAS.') WHERE id='6962'; -- 5315011
      UPDATE sip_clase SET fechadeshabilitacion=NULL, nombre='SANTA TERESA',  observaciones=completa_obs(observaciones, 'Rehabilitado por DIVIPOLA 2019 el 2020-07-23, nombre anterior: PUEBLO NUEVO.') WHERE id='1318'; -- 15757001
      UPDATE sip_clase SET fechadeshabilitacion=NULL, nombre='PRADO',  observaciones=completa_obs(observaciones, 'Rehabilitado por DIVIPOLA 2019 el 2020-07-23, nombre anterior: SECTOR PRADO ENTRADA A CANELON.') WHERE id='4259'; -- 25126016
      UPDATE sip_clase SET fechadeshabilitacion=NULL, nombre='DOSQUEBRADAS',  observaciones=completa_obs(observaciones, 'Rehabilitado por DIVIPOLA 2019 el 2020-07-23, nombre anterior: DOS QUEBRADAS.') WHERE id='12351'; -- 76828004
      UPDATE sip_clase SET fechadeshabilitacion=NULL, nombre='MAPIRIPANA',  observaciones=completa_obs(observaciones, 'Rehabilitado por DIVIPOLA 2019 el 2020-07-23, nombre anterior: MAPIRIPANA.') WHERE id='13066'; -- 94343001

      INSERT INTO sip_clase (id, id_municipio, id_clalocal, nombre, id_tclase, observaciones, fechacreacion, created_at, updated_at) VALUES (15301, 811, '018', 'VALE PAVA', 'CP', 'Aparece en DIVIPOLA 2019.', '2020-07-23', '2020-07-23', '2020-07-23');
      INSERT INTO sip_clase (id, id_municipio, id_clalocal, nombre, id_tclase, observaciones, fechacreacion, created_at, updated_at) VALUES (15302, 1028, '037', 'MACONDO', 'CP', 'Aparece en DIVIPOLA 2019.', '2020-07-23', '2020-07-23', '2020-07-23');
      INSERT INTO sip_clase (id, id_municipio, id_clalocal, nombre, id_tclase, observaciones, fechacreacion, created_at, updated_at) VALUES (15303, 32, '068', 'BANCO DE ARENAS 2', 'CP', 'Aparece en DIVIPOLA 2019.', '2020-07-23', '2020-07-23', '2020-07-23');
      INSERT INTO sip_clase (id, id_municipio, id_clalocal, nombre, id_tclase, observaciones, fechacreacion, created_at, updated_at) VALUES (15304, 382, '005', 'SAN MIGUEL', 'CP', 'Aparece en DIVIPOLA 2019.', '2020-07-23', '2020-07-23', '2020-07-23');
      INSERT INTO sip_clase (id, id_municipio, id_clalocal, nombre, id_tclase, observaciones, fechacreacion, created_at, updated_at) VALUES (15305, 40, '020', 'SAN ANTONIO 2', 'CP', 'Aparece en DIVIPOLA 2019.', '2020-07-23', '2020-07-23', '2020-07-23');
      INSERT INTO sip_clase (id, id_municipio, id_clalocal, nombre, id_tclase, observaciones, fechacreacion, created_at, updated_at) VALUES (15306, 594, '005', 'PUERTO ZANCUDO*', 'CP', 'Aparece en DIVIPOLA 2019.', '2020-07-23', '2020-07-23', '2020-07-23');
      INSERT INTO sip_clase (id, id_municipio, id_clalocal, nombre, id_tclase, observaciones, fechacreacion, created_at, updated_at) VALUES (15307, 51, '044', 'VILLA ALEJANDRA 2', 'CP', 'Aparece en DIVIPOLA 2019.', '2020-07-23', '2020-07-23', '2020-07-23');
      INSERT INTO sip_clase (id, id_municipio, id_clalocal, nombre, id_tclase, observaciones, fechacreacion, created_at, updated_at) VALUES (15308, 51, '045', 'MIRALINDO', 'CP', 'Aparece en DIVIPOLA 2019.', '2020-07-23', '2020-07-23', '2020-07-23');
    
      SELECT setval('sip_clase_id_seq', MAX(id)) FROM sip_clase;

      UPDATE sip_clase SET nombre='LIBERIA', observaciones=completa_obs(observaciones, 'Nombre de DIVIPOLA 2019, el anterior era LIBERIA (CHARCON).') WHERE id=6573;
      UPDATE sip_clase SET nombre='LAURELES', observaciones=completa_obs(observaciones, 'Nombre de DIVIPOLA 2019, el anterior era LAURELES (GUASABRA).') WHERE id=6585;
      UPDATE sip_clase SET nombre='PIAMONTE', observaciones=completa_obs(observaciones, 'Nombre de DIVIPOLA 2019, el anterior era PIAMONTE (SAN RAFAEL).') WHERE id=6706;
      UPDATE sip_clase SET nombre='SAN JOSÉ DE URAMA', observaciones=completa_obs(observaciones, 'Nombre de DIVIPOLA 2019, el anterior era SAN JOSÉ DE URAMA (URAMAGRANDE).') WHERE id=6856;
      UPDATE sip_clase SET nombre='SAN NICOLÁS', observaciones=completa_obs(observaciones, 'Nombre de DIVIPOLA 2019, el anterior era SAN NICOLÁS (VUELTECITAS).') WHERE id=7029;
      UPDATE sip_clase SET nombre='PUERTO VENUS', observaciones=completa_obs(observaciones, 'Nombre de DIVIPOLA 2019, el anterior era PUERTO VENUS (SAMANÁ).') WHERE id=7105;
      UPDATE sip_clase SET nombre='LA MOSCA', observaciones=completa_obs(observaciones, 'Nombre de DIVIPOLA 2019, el anterior era LA MOSCA (LA PLAYA).') WHERE id=7214;
      UPDATE sip_clase SET nombre='BOCAS DEL RÍO ATRATO', observaciones=completa_obs(observaciones, 'Nombre de DIVIPOLA 2019, el anterior era BOCAS DEL RíO ATRATO.') WHERE id=7490;
      UPDATE sip_clase SET nombre='YONDÓ', observaciones=completa_obs(observaciones, 'Nombre de DIVIPOLA 2019, el anterior era YONDÓ (CASABE).') WHERE id=7600;
      UPDATE sip_clase SET nombre='BRISAS DE BOLÍVAR', observaciones=completa_obs(observaciones, 'Nombre de DIVIPOLA 2019, el anterior era CUASPUD CARLOSAMA.') WHERE id=383;
      UPDATE sip_clase SET nombre='ÑANGUMA', observaciones=completa_obs(observaciones, 'Nombre de DIVIPOLA 2019, el anterior era GUAPI.') WHERE id=566;
      UPDATE sip_clase SET nombre='PUEBLO NUEVO - REGENCIA', observaciones=completa_obs(observaciones, 'Nombre de DIVIPOLA 2019, el anterior era PUEBLO NUEVO  - REGENCIA.') WHERE id=613;
      UPDATE sip_clase SET nombre='SANTA CRUZ DE MOMPÓX, DISTRITO ESPECIAL, TURÍSTICO, CULTURAL E HISTÓRICO', observaciones=completa_obs(observaciones, 'Nombre de DIVIPOLA 2019, el anterior era SANTA CRUZ DE MOMPÓX, DISTRITO ESPECIAL, TURÍSTICO, CULTURAL E HISTÓRICO (MOMPÓS).') WHERE id=633;
      UPDATE sip_clase SET nombre='SAN NICOLÁS', observaciones=completa_obs(observaciones, 'Nombre de DIVIPOLA 2019, el anterior era ANCUYA.') WHERE id=614;
      UPDATE sip_clase SET nombre='SAN JACINTO DEL CAUCA', observaciones=completa_obs(observaciones, 'Nombre de DIVIPOLA 2019, el anterior era SAN JACINTO public.DEL CAUCA.') WHERE id=740;
      UPDATE sip_clase SET nombre='VILLA FLOR', observaciones=completa_obs(observaciones, 'Nombre de DIVIPOLA 2019, el anterior era SANTA CRUZ DE MOMPÓX.') WHERE id=787;
      UPDATE sip_clase SET nombre='SAN PEDRO DE IGUAQUE', observaciones=completa_obs(observaciones, 'Nombre de DIVIPOLA 2019, el anterior era SAN PEDRO DE IGUAQUE (CHÍQUIZA).') WHERE id=1041;
      UPDATE sip_clase SET nombre='CHÍQUIZA', observaciones=completa_obs(observaciones, 'Nombre de DIVIPOLA 2019, el anterior era CHÍQUIZA (SAN PEDRO DE IGUAQUE).') WHERE id=1040;
      UPDATE sip_clase SET nombre='KILÓMETRO DOS Y MEDIO', observaciones=completa_obs(observaciones, 'Nombre de DIVIPOLA 2019, el anterior era SOTARÁ - PAISPAMBA.') WHERE id=1230;
      UPDATE sip_clase SET nombre='SORACÁ', observaciones=completa_obs(observaciones, 'Nombre de DIVIPOLA 2019, el anterior era SAN JOSÉ DE TOLUVIEJO (TOLÚ VIEJO).') WHERE id=1336;
      UPDATE sip_clase SET nombre='FONDAS', observaciones=completa_obs(observaciones, 'Nombre de DIVIPOLA 2019, el anterior era FONDAS (VILLA AL MAR).') WHERE id=2242;
      UPDATE sip_clase SET nombre='GUAPI', observaciones=completa_obs(observaciones, 'Nombre de DIVIPOLA 2019, el anterior era GUAPÍ.') WHERE id=2319;
      UPDATE sip_clase SET nombre='NUEVO COLÓN', observaciones=completa_obs(observaciones, 'Nombre de DIVIPOLA 2019, el anterior era NUEVO COLÓN (PALMARITO).') WHERE id=3083;
      UPDATE sip_clase SET nombre='RÍO GRANDE', observaciones=completa_obs(observaciones, 'Nombre de DIVIPOLA 2019, el anterior era RÍO GRANDE (BARRO BLANCO).') WHERE id=4261;
      UPDATE sip_clase SET nombre='LOS SERENEOS', observaciones=completa_obs(observaciones, 'Nombre de DIVIPOLA 2019, el anterior era LOS SERENEOS (CHUNTAME).') WHERE id=4265;
      UPDATE sip_clase SET nombre='ANTONIA SANTOS', observaciones=completa_obs(observaciones, 'Nombre de DIVIPOLA 2019, el anterior era ANTONIA SATNOS (LA ESTACIÓN).') WHERE id=4841;
      UPDATE sip_clase SET nombre='PUERTO MARTÍNEZ', observaciones=completa_obs(observaciones, 'Nombre de DIVIPOLA 2019, el anterior era PUERTO MARTÍNEZ (BAGRERA).') WHERE id=5033;
      UPDATE sip_clase SET nombre='REGUEROS', observaciones=completa_obs(observaciones, 'Nombre de DIVIPOLA 2019, el anterior era REGUEROS (PRADOS DEL NORTE).') WHERE id=5790;
      UPDATE sip_clase SET nombre='CINCO Y SEIS', observaciones=completa_obs(observaciones, 'Nombre de DIVIPOLA 2019, el anterior era CINCO y SEIS (EL BAJO).') WHERE id=6295;
      UPDATE sip_clase SET nombre='PUEBLO VIEJO', observaciones=completa_obs(observaciones, 'Nombre de DIVIPOLA 2019, el anterior era PUEBLO VIEJO (ARENALES).') WHERE id=7718;
      UPDATE sip_clase SET nombre='ANCUYA', observaciones=completa_obs(observaciones, 'Nombre de DIVIPOLA 2019, el anterior era ANCUYÁ.') WHERE id=7985;
      UPDATE sip_clase SET nombre='SAN PEDRO', observaciones=completa_obs(observaciones, 'Nombre de DIVIPOLA 2019, el anterior era SAN PEDRO (BOLÍVAR).') WHERE id=8164;
      UPDATE sip_clase SET nombre='TIERRA GRATA', observaciones=completa_obs(observaciones, 'Nombre de DIVIPOLA 2019, el anterior era TIERRA GRATA (ROMÁN).') WHERE id=9187;
      UPDATE sip_clase SET nombre='BELLA VISTA', observaciones=completa_obs(observaciones, 'Nombre de DIVIPOLA 2019, el anterior era BELLA VISTA (NUEVA GRANADA).') WHERE id=9219;
      UPDATE sip_clase SET nombre='VISTA HERMOSA', observaciones=completa_obs(observaciones, 'Nombre de DIVIPOLA 2019, el anterior era VISTA HERMOSA (EL ESPEJO).') WHERE id=9342;
      UPDATE sip_clase SET nombre='LOS ÁNGELES', observaciones=completa_obs(observaciones, 'Nombre de DIVIPOLA 2019, el anterior era LOS ÁNGELES (CORRAL VIEJO).') WHERE id=10879;
      UPDATE sip_clase SET nombre='TOLUVIEJO', observaciones=completa_obs(observaciones, 'Nombre de DIVIPOLA 2019, el anterior era TOLÚ VIEJO.') WHERE id=11067;
      UPDATE sip_clase SET nombre='EL INGENIO', observaciones=completa_obs(observaciones, 'Nombre de DIVIPOLA 2019, el anterior era EL INGENIO (TARRAGONA PARTE ALTA).') WHERE id=12028;
      UPDATE sip_clase SET nombre='LA QUIEBRA', observaciones=completa_obs(observaciones, 'Nombre de DIVIPOLA 2019, el anterior era LA QUIEBRA (VENTAQUEMADA).') WHERE id=12330;
      UPDATE sip_clase SET nombre='COMUNIDAD INDÍGENA SANTA SOFÍA', observaciones=completa_obs(observaciones, 'Nombre de DIVIPOLA 2019, el anterior era COMUNIDAD INDÍGENA SANTA SOFIA.') WHERE id=13018;
      UPDATE sip_clase SET nombre='COMUNIDAD INDÍGENA EL PROGRESO', observaciones=completa_obs(observaciones, 'Nombre de DIVIPOLA 2019, el anterior era COMUNIDAD INDíGENA EL PROGRESO.') WHERE id=13028;
      UPDATE sip_clase SET nombre='COMUNIDAD INDÍGENA PATIO DE CIENCIA DULCE  KM 11', observaciones=completa_obs(observaciones, 'Nombre de DIVIPOLA 2019, el anterior era COMUNIDAD INDIGENA PATIO DE CIENCIA DULCE KM 11.') WHERE id=13016;
      UPDATE sip_clase SET nombre='ASENTAMIENTO HUMANO TAKANA  KM 11', observaciones=completa_obs(observaciones, 'Nombre de DIVIPOLA 2019, el anterior era ASENTAMIENTO HUMANO TAKANA KM 11 (MULTIÉTNICA).') WHERE id=13019;
      UPDATE sip_clase SET nombre='COMUNIDAD INDÍGENA NUEVO JARDIN', observaciones=completa_obs(observaciones, 'Nombre de DIVIPOLA 2019, el anterior era COMUNIDAD INDÍGENA NUEVO JARDIN 91001025.') WHERE id=13005;
      UPDATE sip_clase SET nombre='COMUNIDAD INDÍGENA ZIERA AMENA', observaciones=completa_obs(observaciones, 'Nombre de DIVIPOLA 2019, el anterior era COMUNIDAD INDIGENA ZIERA AMENA.') WHERE id=15162;
      UPDATE sip_clase SET nombre='COMUNIDAD INDÍGENA CANAAN', observaciones=completa_obs(observaciones, 'Nombre de DIVIPOLA 2019, el anterior era COMUNIDAD INDIGENA CANAAN.') WHERE id=15164;
      UPDATE sip_clase SET nombre='COMUNIDAD INDÍGENA PICHUNA KM 18', observaciones=completa_obs(observaciones, 'Nombre de DIVIPOLA 2019, el anterior era COMUNIDAD INDIGENA PICHUNA KM 18.') WHERE id=15165;
      UPDATE sip_clase SET nombre='COMUNIDAD INDÍGENA SAN JOSÉ DEL RÍO', observaciones=completa_obs(observaciones, 'Nombre de DIVIPOLA 2019, el anterior era COMUNIDAD INDIGENA SAN JOSE DEL RIO.') WHERE id=15166;
      UPDATE sip_clase SET nombre='COMUNIDAD INDÍGENA SAN JUAN DE LOS PARENTES', observaciones=completa_obs(observaciones, 'Nombre de DIVIPOLA 2019, el anterior era COMUNIDAD INDIGENA SAN JUAN DE LOS PARENTES.') WHERE id=15167;
      UPDATE sip_clase SET nombre='COMUNIDAD INDÍGENA SAN PEDRO DE LOS LAGOS', observaciones=completa_obs(observaciones, 'Nombre de DIVIPOLA 2019, el anterior era COMUNIDAD INDIGENA SAN PEDRO DE LOS LAGOS.') WHERE id=15168;
      UPDATE sip_clase SET nombre='RESGUARDO CACAHUAL RIO ATABAPO', observaciones=completa_obs(observaciones, 'Nombre de DIVIPOLA 2019, el anterior era RESGUARDO CACAHUAL RIO ATABAPO (CHAQUITA).') WHERE id=13057;
      UPDATE sip_clase SET nombre='BARRANCOMINAS', observaciones=completa_obs(observaciones, 'Nombre de DIVIPOLA 2019, el anterior era BARRANCO MINAS.') WHERE id=13064;
      UPDATE sip_clase SET nombre='ARRECIFAL', observaciones=completa_obs(observaciones, 'Nombre de DIVIPOLA 2019, el anterior era ARRECIFAL.') WHERE id=13063;
      UPDATE sip_clase SET nombre='MINITAS', observaciones=completa_obs(observaciones, 'Nombre de DIVIPOLA 2019, el anterior era MINITAS.') WHERE id=15176;
      UPDATE sip_clase SET nombre='GALILEA', observaciones=completa_obs(observaciones, 'Nombre de DIVIPOLA 2019, el anterior era GALILEA (LA GUADALUPE).') WHERE id=13072;
      UPDATE sip_clase SET nombre='PUERTO SOLANO (PAPUNAHUA)', observaciones=completa_obs(observaciones, 'Nombre de DIVIPOLA 2019, el anterior era PUERTO SOLANO (PAPUNAHUA; MORICHAL).') WHERE id=13137;

    -- Tipo de centro poblado

    UPDATE sip_clase SET id_tclase='CP', observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era C.' WHERE id_tclase='C' AND fechadeshabilitacion IS NULL;
    UPDATE sip_clase SET id_tclase='CP', observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era CAS.' WHERE id_tclase='CAS' AND fechadeshabilitacion IS NULL;
    UPDATE sip_clase SET id_tclase='CP', observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era IPD.' WHERE id_tclase='IPD' AND fechadeshabilitacion IS NULL;
    UPDATE sip_clase SET id_tclase='CP', observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era IP.' WHERE id_tclase='IP' AND fechadeshabilitacion IS NULL;
    UPDATE sip_clase SET id_tclase='CP', observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era IPM.' WHERE id_tclase='IPM' AND fechadeshabilitacion IS NULL;
    UPDATE sip_clase SET id_tclase='CP', observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era CD.' WHERE id_tclase='CD' AND fechadeshabilitacion IS NULL;
    UPDATE sip_clase SET id_tclase='CM' WHERE id=13064; --BARRANCOMINAS
    SQL
  end

  def down
  end
end
