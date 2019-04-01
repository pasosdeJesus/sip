class SinRestriccionInversoTrelacion < ActiveRecord::Migration[5.2]
  def change
    execute <<-SQL
      ALTER TABLE  sip_trelacion DROP CONSTRAINT IF EXISTS relacion_inverso_fkey;
    SQL
  end
end
