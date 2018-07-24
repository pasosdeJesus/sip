# encoding: utf-8

class CreateSipPerfilactorsocial < ActiveRecord::Migration[5.2]
  def up
    create_table :sip_perfilactorsocial do |t|
      t.string :nombre, limit: 500, null: false
      t.string :observaciones, limit: 5000
      t.date :fechacreacion, null: false
      t.date :fechadeshabilitacion
      t.timestamp :created_at, null: false
      t.timestamp :updated_at, null: false
    end
    execute <<-SQL
      INSERT INTO sip_perfilactorsocial (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (1, 'SIN INFORMACIÓN', '2009-09-11', NULL, '2018-07-24', '2018-07-24');
      INSERT INTO sip_perfilactorsocial (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (2, 'FUNCIONARIO/A O CONTRATISTA DE LA ORGANIZACIÓN', '2009-09-11', NULL, '2018-07-24', '2018-07-24');
      INSERT INTO sip_perfilactorsocial (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (3, 'DIRECTIVO/A DE LA ORGANIZACIÓN', '2009-09-11', NULL, '2018-07-24', '2018-07-24');
      INSERT INTO sip_perfilactorsocial (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (4, 'FAMILIAR DE DEFENSOR/A O DE LÍDER SOCIAL', '2009-09-11', NULL, '2018-07-24', '2018-07-24');
      INSERT INTO sip_perfilactorsocial (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (5, 'MIEMBRO DE LA ORGANIZACIÓN', '2009-09-11', NULL, '2018-07-24', '2018-07-24');
    SQL
  end
  def down
    drop_table :sip_perfilactorsocial
  end
end
