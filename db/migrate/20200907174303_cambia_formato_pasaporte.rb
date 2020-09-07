class CambiaFormatoPasaporte < ActiveRecord::Migration[6.0]
  def up
    execute <<-SQL
      UPDATE sip_tdocumento SET formatoregex='[A-Z]*[0-9]*' WHERE id='9';
    SQL
  end

  def down
    execute <<-SQL
      UPDATE sip_tdocumento SET formatoregex='[0-9]*' WHERE id='9';
    SQL
  end
end
