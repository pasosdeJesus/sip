class ArreglaFalcon < ActiveRecord::Migration[6.1]
  def up
    execute <<-SQL
      UPDATE sip_departamento SET nombre = 'FALCÓN', observaciones=NULL WHERE id=5;
    SQL
  end
  def down
  end
end
