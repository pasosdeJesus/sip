class TemaAzulPorOmision < ActiveRecord::Migration[6.0]
  def up
    execute <<-SQL
      INSERT INTO sip_tema (id, nombre, nav_ini, nav_fin, nav_fuente,
        fondo_lista, 
        fechacreacion,  created_at, updated_at)
      VALUES (1, 'AZUL POR OMISIÓN', '266DD3', '266DD3',
              'FFFFFF', '95C4FF', '2019-07-15', '2019-07-15', '2019-07-15'  );
      SELECT setval('sip_tema_id_seq', MAX(id)+1) FROM 
        (SELECT 100 as id UNION SELECT MAX(id) FROM sip_tema) AS s;
    SQL
  end

  def down
    execute <<-SQL
      DELETE FROM sip_tema WHERE id=1;
    SQL
  end
end
