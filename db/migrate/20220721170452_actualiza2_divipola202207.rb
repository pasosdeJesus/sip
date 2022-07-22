class Actualiza2Divipola202207 < ActiveRecord::Migration[7.0]
  def up
    execute <<-SQL
      -- Centros poblados deshabilitados que vuelven a habilitarse:
      INSERT INTO sip_clase_histvigencia (clase_id, vigenciaini, vigenciafin, 
      nombre, id_clalocal, observaciones)
      VALUES (7043, '2011-01-01', '2015-12-31',
      'Pan de Azucar', 20, 'Aparece en DIVIPOLAs 2011 a 2015. Desapareció en DIVIPOLAS 2016-2021. Reapareció en 2022 con el mismo código y con tilde.');
      UPDATE sip_clase SET 
      nombre='Pan de Azúcar',
      fechadeshabilitacion=NULL, observaciones='Aparece en DIVIPOLAs 2011 a 2015. Desaparción en DIVIPOLAS 2016, 2017, 2018, 2019, 2020 y 2021. Volvió a aparecer en DIVIPOLA 2022 con el mismo código.' WHERE id='7043'; -- Pan de Azúcar / La Estrella / Antioquia.


      -- Nuevos cps (algunos estaban con otro código y municipio)

       INSERT INTO sip_clase (id, nombre, id_municipio, id_clalocal, observaciones, fechacreacion, created_at, updated_at)  VALUES (15422, 'El Alto del Pollo', 1221, 34, 'Agregado en DIVIPOLA 2022.', '2022-07-21', '2022-07-21', '2022-07-21');
       INSERT INTO sip_clase (id, nombre, id_municipio, id_clalocal, observaciones, fechacreacion, created_at, updated_at)  VALUES (15423, 'California', 361, 17, 'Agregado en DIVIPOLA 2022.', '2022-07-21', '2022-07-21', '2022-07-21');
       INSERT INTO sip_clase (id, nombre, id_municipio, id_clalocal, observaciones, fechacreacion, created_at, updated_at)  VALUES (15424, 'Condominio Hacienda', 1347, 11, 'Agregado en DIVIPOLA 2022.', '2022-07-21', '2022-07-21', '2022-07-21');
       INSERT INTO sip_clase (id, nombre, id_municipio, id_clalocal, observaciones, fechacreacion, created_at, updated_at)  VALUES (15425, 'Mata de Barro', 1267, 18, 'Agregado en DIVIPOLA 2022.', '2022-07-21', '2022-07-21', '2022-07-21');
       INSERT INTO sip_clase (id, nombre, id_municipio, id_clalocal, observaciones, fechacreacion, created_at, updated_at)  VALUES (15426, 'San Jerónimo (Golero)', 41, 74, 'Agregado en DIVIPOLA 2022.', '2022-07-21', '2022-07-21', '2022-07-21');
       INSERT INTO sip_clase (id, nombre, id_municipio, id_clalocal, observaciones, fechacreacion, created_at, updated_at)  VALUES (15427, 'Carolina', 237, 33, 'Agregado en DIVIPOLA 2022.', '2022-07-21', '2022-07-21', '2022-07-21');
       INSERT INTO sip_clase (id, nombre, id_municipio, id_clalocal, observaciones, fechacreacion, created_at, updated_at)  VALUES (15428, 'Santa Cruz', 1326, 35, 'Agregado en DIVIPOLA 2022.', '2022-07-21', '2022-07-21', '2022-07-21');
       INSERT INTO sip_clase (id, nombre, id_municipio, id_clalocal, observaciones, fechacreacion, created_at, updated_at)  VALUES (15429, 'Callejas', 1368, 24, 'Agregado en DIVIPOLA 2022.', '2022-07-21', '2022-07-21', '2022-07-21');
       INSERT INTO sip_clase (id, nombre, id_municipio, id_clalocal, observaciones, fechacreacion, created_at, updated_at)  VALUES (15430, 'Unión Misara', 1237, 35, 'Agregado en DIVIPOLA 2022.', '2022-07-21', '2022-07-21', '2022-07-21');
       INSERT INTO sip_clase (id, nombre, id_municipio, id_clalocal, observaciones, fechacreacion, created_at, updated_at)  VALUES (15431, 'Bella Vista', 1237, 36, 'Agregado en DIVIPOLA 2022.', '2022-07-21', '2022-07-21', '2022-07-21');
       INSERT INTO sip_clase (id, nombre, id_municipio, id_clalocal, observaciones, fechacreacion, created_at, updated_at)  VALUES (15432, 'Nipordu', 234, 11, 'Agregado en DIVIPOLA 2022.', '2022-07-21', '2022-07-21', '2022-07-21');
       INSERT INTO sip_clase (id, nombre, id_municipio, id_clalocal, observaciones, fechacreacion, created_at, updated_at)  VALUES (15433, 'Hacienda Horizontes', 297, 35, 'Agregado en DIVIPOLA 2022.', '2022-07-21', '2022-07-21', '2022-07-21');
       INSERT INTO sip_clase (id, nombre, id_municipio, id_clalocal, observaciones, fechacreacion, created_at, updated_at)  VALUES (15434, 'Las Palmas', 364, 25, 'Agregado en DIVIPOLA 2022.', '2022-07-21', '2022-07-21', '2022-07-21');
       INSERT INTO sip_clase (id, nombre, id_municipio, id_clalocal, observaciones, fechacreacion, created_at, updated_at)  VALUES (15435, 'Hato Viejo', 364, 26, 'Agregado en DIVIPOLA 2022.', '2022-07-21', '2022-07-21', '2022-07-21');
       INSERT INTO sip_clase (id, nombre, id_municipio, id_clalocal, observaciones, fechacreacion, created_at, updated_at)  VALUES (15436, 'Las Huertas', 886, 20, 'Agregado en DIVIPOLA 2022.', '2022-07-21', '2022-07-21', '2022-07-21');
       INSERT INTO sip_clase (id, nombre, id_municipio, id_clalocal, observaciones, fechacreacion, created_at, updated_at)  VALUES (15437, 'Totumal', 1244, 53, 'Agregado en DIVIPOLA 2022.', '2022-07-21', '2022-07-21', '2022-07-21');
       INSERT INTO sip_clase (id, nombre, id_municipio, id_clalocal, observaciones, fechacreacion, created_at, updated_at)  VALUES (15438, 'La Estrella', 1091, 22, 'Agregado en DIVIPOLA 2022.', '2022-07-21', '2022-07-21', '2022-07-21');
       INSERT INTO sip_clase (id, nombre, id_municipio, id_clalocal, observaciones, fechacreacion, created_at, updated_at)  VALUES (15439, 'La Delfina', 401, 49, 'Agregado en DIVIPOLA 2022.', '2022-07-21', '2022-07-21', '2022-07-21');
       INSERT INTO sip_clase (id, nombre, id_municipio, id_clalocal, observaciones, fechacreacion, created_at, updated_at)  VALUES (15440, 'El Edén', 401, 50, 'Agregado en DIVIPOLA 2022.', '2022-07-21', '2022-07-21', '2022-07-21');
       INSERT INTO sip_clase (id, nombre, id_municipio, id_clalocal, observaciones, fechacreacion, created_at, updated_at)  VALUES (15441, 'Playa Larga', 401, 51, 'Agregado en DIVIPOLA 2022.', '2022-07-21', '2022-07-21', '2022-07-21');
    SQL
  end

  def down
    execute <<-SQL
      DELETE FROM sip_clase WHERE id>=15422 AND id<=15441;
      DELETE FROM sip_clase_histvigencia 
        WHERE clase_id=7043
        AND vigenciaini='2011-01-01'
        AND vigenciafin='2015-12-31'
      ;
      UPDATE sip_clase SET fechadeshabilitacion='2019-03-31' WHERE id='7043'; -- Pan de Azucar / La Estrella / Antioquia.
    SQL
  end
end
