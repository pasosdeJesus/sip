class AgregaTdocumentoCe < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      INSERT INTO sip_tdocumento (id,  nombre, sigla, formatoregex, 
        fechacreacion, created_at, updated_at) 
        SELECT 13, 'CÉDULA DE EXTRANJERÍA', 'CE', '[0-9]*',
        '2018-09-21', '2018-09-21', '2018-09-21'
        WHERE NOT EXISTS (SELECT 1 FROM sip_tdocumento WHERE id=13);
    SQL
  end
  def down
    execute <<-SQL
      DELETE FROM sip_tdocumento WHERE id='13'; 
    SQL
  end
end
