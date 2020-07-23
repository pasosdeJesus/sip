class DeshabilitaAlgunosTclase < ActiveRecord::Migration[6.0]
  def up
    execute <<-SQL
      UPDATE sip_tclase SET fechadeshabilitacion='2020-07-23',
        observaciones=completa_obs(observaciones, 'Tipo de centro poblado deshabilitado por DIVIPOLA 2019') 
        WHERE id IN ('IPM', 'IPD', 'IP', 'COMUNA', 'CI',
        'CD', 'CC', 'CAS', 'C');
      INSERT INTO sip_tclase (id, nombre, fechacreacion, created_at, updated_at, observaciones)
        VALUES ('ANM', 'ÁREA NO MUNICIPALIZADA', '2020-07-23', '2020-07-23',
        '2020-07-23', 'Creado por DIVIPOLA 2019.');
    SQL
  end
  def down
  end
end
