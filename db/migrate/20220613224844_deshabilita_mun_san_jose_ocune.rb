class DeshabilitaMunSanJoseOcune < ActiveRecord::Migration[7.0]
  def up
    execute <<-SQL
      UPDATE sip_municipio SET fechadeshabilitacion='2022-06-13',
        observaciones='Según Wikipedia antiguamente fue un área no municipalizada pero por ordenanza fue incluida al crear el municipio de Cumaribo en 1996.'
      WHERE id=1227;
    SQL
    if view_exists?('sip_mundep')
      execute <<-SQL
        REFRESH MATERIALIZED VIEW sip_mundep;
      SQL
    end
  end
  def down
    execute <<-SQL
      UPDATE sip_municipio SET fechadeshabilitacion=NULL, observaciones='' WHERE id=1227;
    SQL
  end
end
