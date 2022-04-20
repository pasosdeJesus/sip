class ArreglaFalcon < ActiveRecord::Migration[7.0]
  def up
    execute <<-SQL
      UPDATE sip_departamento SET nombre = 'Falcón', observaciones=NULL WHERE id=5;
    SQL
  end
  def down
  end
end
