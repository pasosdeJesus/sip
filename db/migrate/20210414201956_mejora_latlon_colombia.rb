class MejoraLatlonColombia < ActiveRecord::Migration[6.1]
  def up
    execute <<-SQL
      UPDATE sip_pais SET latitud=4.7465, longitud=-75.0974
        WHERE id=170;
    SQL
  end
  def down
    execute <<-SQL
      UPDATE sip_pais SET latitud=-75.0974, longitud=4.7465
        WHERE id=170;
    SQL
  end
end
