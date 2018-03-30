class GrupoConCotejacion < ActiveRecord::Migration[5.1]
  def up
    execute <<-SQL
      ALTER TABLE sip_grupo ALTER COLUMN nombre
        TYPE VARCHAR(500) COLLATE es_co_utf_8;
    SQL
  end

  def down
    execute <<-SQL
      ALTER TABLE sip_grupo ALTER COLUMN nombre
        TYPE VARCHAR(500);
    SQL
  end
end
