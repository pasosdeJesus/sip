class OrtografiaDepto < ActiveRecord::Migration[5.0]
  def up
    execute <<-SQL
      UPDATE sip_departamento SET nombre='QUINDÍO' WHERE nombre='QUINDIO';
      UPDATE sip_departamento SET nombre='BOGOTÁ, D.C.' WHERE nombre='BOGOTÁ D.C.';
    SQL
  end
  def down
    execute <<-SQL
      UPDATE sip_departamento SET nombre='QUINDIO' WHERE nombre='QUINDÍO';
      UPDATE sip_departamento SET nombre='BOGOTÁ D.C.' WHERE nombre='BOGOTÁ, D.C.';
    SQL
  end
end
