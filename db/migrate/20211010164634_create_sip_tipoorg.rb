class CreateSipTipoorg < ActiveRecord::Migration[6.1]
  include Sip::SqlHelper
  def up
    create_table :sip_tipoorg do |t|
      t.string :nombre, limit: 500, null: false
      t.string :observaciones, limit: 5000
      t.date :fechacreacion, null: false
      t.date :fechadeshabilitacion

      t.timestamps
    end
    cambiaCotejacion('sip_tipoorg', 'nombre', 500, 'es_co_utf_8')
    execute <<-SQL
      INSERT INTO sip_tipoorg (id, nombre, 
        fechacreacion, created_at, updated_at) VALUES (
        1, 'ORGANIZACIÓN DE LA SOCIEDAD CIVIL (ACOMPAÑADA)',
        '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO sip_tipoorg (id, nombre, 
        fechacreacion, created_at, updated_at) VALUES (
        2, 'ORGANIZACIÓN DE LA SOCIEDAD CIVIL',
        '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO sip_tipoorg (id, nombre, 
        fechacreacion, created_at, updated_at) VALUES (
        3, 'ESTADO',
        '2022-04-28', '2022-04-28', '2022-04-28');
      INSERT INTO sip_tipoorg (id, nombre, 
        fechacreacion, created_at, updated_at) VALUES (
        5, 'ORGANISMO INTERNACIONAL',
        '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO sip_tipoorg (id, nombre, 
        fechacreacion, created_at, updated_at) VALUES (
        20, 'GRUPO ARMADO',
        '2022-04-28', '2022-04-28', '2022-04-28');

      SELECT setval('sip_tipoorg_id_seq', 100);
    SQL
  end
  def down
    drop_table :sip_tipoorg
  end
end
