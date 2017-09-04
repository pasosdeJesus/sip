class RolMayorQue1 < ActiveRecord::Migration[4.2]
  def up
    execute <<-SQL
         ALTER TABLE usuario DROP CONSTRAINT usuario_rol_check;
         ALTER TABLE usuario ADD CONSTRAINT usuario_rol_check CHECK
            (rol>=1);
    SQL
  end
  def down
    execute <<-SQL
         ALTER TABLE usuario DROP CONSTRAINT usuario_rol_check;
         ALTER TABLE usuario ADD CONSTRAINT usuario_rol_check CHECK
            (rol>=1 AND rol<=6);
    SQL
  end
end
