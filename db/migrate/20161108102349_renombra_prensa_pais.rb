class RenombraPrensaPais < ActiveRecord::Migration[5.0]
  def up
    execute <<-SQL
      UPDATE sip_fuenteprensa SET nombre='EL PAÍS' WHERE nombre='EL PAIS';
      UPDATE sip_fuenteprensa SET nombre='EL NUEVO SIGLO' WHERE nombre='NUEVO SIGLO';
    SQL
  end
  def down
    execute <<-SQL
      UPDATE sip_fuenteprensa SET nombre='EL PAIS' WHERE nombre='EL PAÍS';
      UPDATE sip_fuenteprensa SET nombre='NUEVO SIGLO' WHERE nombre='EL NUEVO SIGLO';
    SQL
  end

end
