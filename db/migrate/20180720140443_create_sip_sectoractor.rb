class CreateSipSectoractor < ActiveRecord::Migration[5.2]
  def up
    create_table :sip_sectoractor do |t|
      t.string :nombre, limit: 500, null: false
      t.string :observaciones, limit: 5000
      t.date :fechacreacion, null: false
      t.date :fechadeshabilitacion
      t.timestamp :created_at, null: false
      t.timestamp :updated_at, null: false
    end
    execute <<-SQL
    INSERT INTO sip_sectoractor(id, nombre, observaciones, 
      fechacreacion, created_at, updated_at)
      VALUES ('1', 'SIN INFORMACIÓN', '', 
      '2018-07-20', '2018-07-20', '2018-07-20');
    INSERT INTO sip_sectoractor(id, nombre, observaciones, 
      fechacreacion, created_at, updated_at)
      VALUES ('2', 'INDÍGENAS', '', 
      '2018-07-20', '2018-07-20', '2018-07-20');
    INSERT INTO sip_sectoractor(id, nombre, observaciones, 
      fechacreacion, created_at, updated_at)
      VALUES ('3', 'CAMPESINOS', '', 
      '2018-07-20', '2018-07-20', '2018-07-20');
    INSERT INTO sip_sectoractor(id, nombre, observaciones, 
      fechacreacion, created_at, updated_at)
      VALUES ('4', 'VÍCTIMAS', '', 
      '2018-07-20', '2018-07-20', '2018-07-20');
    SQL
  end
  def down
    drop_table :sip_sectoractor
  end
end
