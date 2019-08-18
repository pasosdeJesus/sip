class CreateTrivalente < ActiveRecord::Migration[6.0]
  def up
    create_table :sip_trivalente do |t|
      t.string :nombre, limit: 500, null: false
      t.string :observaciones, limit: 5000
      t.date :fechacreacion, null: false
      t.date :fechadeshabilitacion
      t.timestamp :created_at, null: false
      t.timestamp :updated_at, null: false
    end
    execute <<-SQL
      INSERT INTO sip_trivalente 
        (id, nombre, fechacreacion, created_at, updated_at)
        VALUES (1, 'SIN RESPUESTA', '2019-08-16', '2019-08-16', '2019-08-16');
      INSERT INTO sip_trivalente 
        (id, nombre, fechacreacion, created_at, updated_at)
        VALUES (2, 'SI', '2019-08-16', '2019-08-16', '2019-08-16');
      INSERT INTO sip_trivalente 
        (id, nombre, fechacreacion, created_at, updated_at)
        VALUES (3, 'NO', '2019-08-16', '2019-08-16', '2019-08-16');
    SQL
  end

  def down
    drop_table :sip_trivalente
  end
end
