class CreaFuente < ActiveRecord::Migration
  def up
    create_table :sip_fuenteprensa do |t|
      t.string :nombre, limit: 500
      t.string :observaciones, limit: 5000
      t.date :fechacreacion
      t.date :fechadeshabilitacion
      t.datetime "created_at", null: false
      t.datetime "updated_at"
    end
    execute <<-SQL
      INSERT INTO sip_fuenteprensa(id, nombre, fechacreacion, created_at) VALUES (41,'BOYACÁ 7 DÍAS', '2001-01-01', '2015-05-11');
      INSERT INTO sip_fuenteprensa(id, nombre, fechacreacion, created_at) VALUES (24,'CRONICA JUDICIAL', '2001-01-01', '2015-05-11');
      INSERT INTO sip_fuenteprensa(id, nombre, fechacreacion, created_at) VALUES (39,'DIARIO DEL MAGDALENA', '2001-01-01', '2015-05-11');
      INSERT INTO sip_fuenteprensa(id, nombre, fechacreacion, created_at) VALUES (42,'DIARIO DEL SUR', '2001-01-01', '2015-05-11');
      INSERT INTO sip_fuenteprensa (id, nombre, fechacreacion, created_at) VALUES ('44', 'DIARIO DEL CAUCA', '2015-05-11', '2015-05-11');
      INSERT INTO sip_fuenteprensa(id, nombre, fechacreacion, created_at) VALUES ('45', 'EL BOGOTANO', '2015-05-11', '2015-05-11');
      INSERT INTO sip_fuenteprensa(id, nombre, fechacreacion, created_at) VALUES ('46', 'EL CATOLICISMO', '2015-05-11', '2015-05-11');
      INSERT INTO sip_fuenteprensa(id, nombre, fechacreacion, created_at) VALUES (3,'EL COLOMBIANO', '2001-01-01', '2015-05-11');
      INSERT INTO sip_fuenteprensa(id, nombre, fechacreacion, created_at) VALUES ('9', 'EL ESPACIO', '2015-05-11', '2015-05-11');
      INSERT INTO sip_fuenteprensa(id, nombre, fechacreacion, created_at) VALUES (2,'EL ESPECTADOR', '2001-01-01', '2015-05-11');
      INSERT INTO sip_fuenteprensa(id, nombre, fechacreacion, created_at) VALUES (8,'EL HERALDO', '2001-01-01', '2015-05-11');
      INSERT INTO sip_fuenteprensa(id, nombre, fechacreacion, created_at) VALUES (11,'EL MERIDIANO', '2001-01-01', '2015-05-11');
      INSERT INTO sip_fuenteprensa(id, nombre, fechacreacion, created_at) VALUES (7,'EL PAIS', '2001-01-01', '2015-05-11');
      INSERT INTO sip_fuenteprensa(id, nombre, fechacreacion, created_at) VALUES (15,'EL LIBERAL', '2001-01-01', '2015-05-11');
      INSERT INTO sip_fuenteprensa(id, nombre, fechacreacion, created_at) VALUES ('47', 'EL LIBERTADOR', '2015-05-11', '2015-05-11');
      INSERT INTO sip_fuenteprensa(id, nombre, fechacreacion, created_at) VALUES (4,'EL MUNDO', '2001-01-01', '2015-05-11');
      INSERT INTO sip_fuenteprensa(id, nombre, fechacreacion, created_at) VALUES (16,'EL NUEVO DIA', '2001-01-01', '2015-05-11');
      INSERT INTO sip_fuenteprensa(id, nombre, fechacreacion, created_at) VALUES (36,'EL NUEVO ORIENTE', '2001-01-01', '2015-05-11');
      INSERT INTO sip_fuenteprensa(id, nombre, fechacreacion, created_at) VALUES (1,'EL TIEMPO', '2001-01-01', '2015-05-11');
      INSERT INTO sip_fuenteprensa(id, nombre, fechacreacion, created_at) VALUES (10,'EL UNIVERSAL', '2001-01-01', '2015-05-11');
      INSERT INTO sip_fuenteprensa(id, nombre, fechacreacion, created_at) VALUES ('48', 'EL VESPERTINO', '2015-05-11', '2015-05-11');
      INSERT INTO sip_fuenteprensa(id, nombre, fechacreacion, created_at) VALUES ('49', 'EXTRA', '2015-05-11', '2015-05-11');
      INSERT INTO sip_fuenteprensa(id, nombre, fechacreacion, created_at) VALUES (54,'LA LIBERTAD', '2001-01-01', '2015-05-11');
      INSERT INTO sip_fuenteprensa(id, nombre, fechacreacion, created_at) VALUES (19,'LA NACIÓN', '2001-01-01', '2015-05-11');
      INSERT INTO sip_fuenteprensa(id, nombre, fechacreacion, created_at) VALUES (14,'LA OPINIÓN', '2001-01-01', '2015-05-11');
      INSERT INTO sip_fuenteprensa(id, nombre, fechacreacion, created_at) VALUES (5,'LA PATRIA', '2001-01-01', '2015-05-11');
      INSERT INTO sip_fuenteprensa(id, nombre, fechacreacion, created_at) VALUES ('50', 'LA REPÚBLICA', '2015-05-11', '2015-05-11');
      INSERT INTO sip_fuenteprensa(id, nombre, fechacreacion, created_at) VALUES (6,'LA TARDE', '2001-01-01', '2015-05-11');
      INSERT INTO sip_fuenteprensa(id, nombre, fechacreacion, created_at) VALUES ('51', 'LA UNION', '2015-05-11', '2015-05-11');
      INSERT INTO sip_fuenteprensa(id, nombre, fechacreacion, created_at) VALUES ('53', 'VOZ PROLETARIA', '2015-05-11', '2015-05-11');
      INSERT INTO sip_fuenteprensa(id, nombre, fechacreacion, created_at) VALUES (18,'LLANO 7 DÍAS', '2001-01-01', '2015-05-11');
      INSERT INTO sip_fuenteprensa(id, nombre, fechacreacion, created_at) VALUES ('52', 'NUEVO SIGLO', '2015-05-11', '2015-05-11');
      INSERT INTO sip_fuenteprensa(id, nombre, fechacreacion, created_at) VALUES (43,'SU MERIDIANO DE SUCRE', '2001-01-01', '2015-05-11');
      INSERT INTO sip_fuenteprensa(id, nombre, fechacreacion, created_at) VALUES (12,'VANGUARDIA LIBERAL', '2001-01-01', '2015-05-11');
      INSERT INTO sip_fuenteprensa(id, nombre, fechacreacion, created_at) VALUES (13,'VANGUARDIA LIBERAL BARRANCA', '2001-01-01', '2015-05-11');
      INSERT INTO sip_fuenteprensa(id, nombre, fechacreacion, created_at) VALUES (17,'VOZ', '2001-01-01', '2015-05-11');
    SQL
  end
  def down 
    drop_table :sip_fuenteprensa
  end
end
