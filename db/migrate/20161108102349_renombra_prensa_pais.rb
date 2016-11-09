class RenombraPrensaPais < ActiveRecord::Migration[5.0]
  def up
    execute <<-SQL
      UPDATE sip_fuenteprensa SET nombre='EL PAÍS' WHERE nombre='EL PAIS';
      UPDATE sip_fuenteprensa SET nombre='EL NUEVO SIGLO' WHERE nombre='NUEVO SIGLO';
      UPDATE sip_fuenteprensa SET nombre='LA UNIÓN' WHERE nombre='LA UNION';
      UPDATE sip_fuenteprensa SET nombre='HOY DIARIO DEL MAGDALENA' WHERE nombre='DIARIO DEL MAGDALENA';
    SQL
  end
  def down
    execute <<-SQL
      UPDATE sip_fuenteprensa SET nombre='EL PAIS' WHERE nombre='EL PAÍS';
      UPDATE sip_fuenteprensa SET nombre='NUEVO SIGLO' WHERE nombre='EL NUEVO SIGLO';
      UPDATE sip_fuenteprensa SET nombre='LA UNION' WHERE nombre='LA UNIÓN';
      UPDATE sip_fuenteprensa SET nombre='DIARIO DEL MAGDALENA' WHERE nombre='HOY DIARIO DEL MAGDALENA';
    SQL
  end

end
