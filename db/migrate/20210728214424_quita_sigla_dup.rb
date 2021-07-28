class QuitaSiglaDup < ActiveRecord::Migration[6.1]
  def up
    execute <<-SQL
      UPDATE sip_tdocumento SET sigla='CON' WHERE id=5;
    SQL
  end
  def down
    execute <<-SQL
      UPDATE sip_tdocumento SET sigla='CT' WHERE id=5;
    SQL
  end
end
