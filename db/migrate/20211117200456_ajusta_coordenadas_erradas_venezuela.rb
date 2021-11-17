class AjustaCoordenadasErradasVenezuela < ActiveRecord::Migration[6.1]
  def up
    execute <<-SQL
      UPDATE sip_municipio SET latitud=2.8635, longitud=-64.8461
        WHERE id=990; -- AUTÓNOMO ALTO ORINOCO 
      UPDATE sip_municipio SET latitud=10.78, longitud=-71
        WHERE id=153; -- MAUROA
      UPDATE sip_municipio SET latitud=8.3275, longitud=-71.8542
        WHERE id=434; -- SIMÓN RODRÍGUEZ
      UPDATE sip_municipio SET latitud=8.301, longitud=-70.0707
        WHERE id=668; -- BARINAS
      UPDATE sip_municipio SET latitud=4.9706, longitud=-65.8503
        WHERE id=990; -- AUTÓNOMO MANAPIARE
      UPDATE sip_municipio SET latitud=10.4055, longitud=-63.9383
        WHERE id=991; -- BOLÍVAR
      UPDATE sip_municipio SET latitud=10.17, longitud=-68.6
        WHERE id=1296; -- JUAN VICENTE CAMPO ELÍAS
    SQL
  end
  def down
  end
end
