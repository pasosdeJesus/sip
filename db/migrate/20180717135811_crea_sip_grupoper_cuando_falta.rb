include Sip::SqlHelper

class CreaSipGrupoperCuandoFalta < ActiveRecord::Migration[5.2]
  def up
    if !table_exists?('sip_grupoper')
      create_table 'sip_grupoper' do |t|
        t.string :nombre, limit: 500, null: false
        t.string :anotaciones, limit: 1000
      end
      cambiaCotejacion('sip_grupoper', 'nombre',  500, 'es_co_utf_8')
      execute <<-SQL
      COMMENT ON TABLE sip_grupoper IS 'Creado por sip en #{ActiveRecord::Base.connection.current_database}';
      SQL
      # El problema de este método es que se comparten comentarios para
      # todas las bases de datos del mismo usuario, asi que sip_grupoper
      # de la base sipdes es visible desde la base sivel2sd_des
      # por eso agregamos el nombre de la base al comentario
    end
  end
  def down
    com = ActiveRecord::Base.connection.execute(
      "SELECT obj_description('sip_grupoper'::regclass, 'pg_class');")
    cc = "Creado por sip en #{ActiveRecord::Base.connection.current_database}"
    if com[0]['obj_description'] == cc
      drop_table 'sip_grupoper'
    end
  end
end
