class AgregaCoordenadasDepartamentosVenezuelaRandolf < ActiveRecord::Migration
  def up
    execute <<-SQL
      UPDATE sip_departamento SET latitud='10.468619', longitud='-66.805812' WHERE id='1';
      UPDATE sip_departamento SET latitud='9.056624', longitud='-62.050996' WHERE id='2';
      UPDATE sip_departamento SET latitud='11.326864', longitud='-69.519421' WHERE id='5';
      UPDATE sip_departamento SET latitud='9.972178', longitud='-67.311793' WHERE id='6';
      UPDATE sip_departamento SET latitud='10.058306', longitud='-69.360544' WHERE id='8';
      UPDATE sip_departamento SET latitud='8.600072', longitud='-71.148234' WHERE id='9';
      UPDATE sip_departamento SET latitud='10.339453', longitud='-66.990739' WHERE id='10';
      UPDATE sip_departamento SET latitud='9.752045', longitud='-63.183264' WHERE id='12';
      UPDATE sip_departamento SET latitud='11.031874', longitud='-63.873192' WHERE id='14';
      UPDATE sip_departamento SET latitud='9.07457', longitud='-69.738914' WHERE id='16';
      UPDATE sip_departamento SET latitud='10.598579', longitud='-63.035111' WHERE id='18';
      UPDATE sip_departamento SET latitud='10.157422', longitud='-67.997211' WHERE id='19';
      UPDATE sip_departamento SET latitud='7.778274', longitud='-72.277961' WHERE id='21';
      UPDATE sip_departamento SET latitud='9.371013', longitud='-70.434206' WHERE id='22';
      UPDATE sip_departamento SET latitud='10.350491', longitud='-68.722471' WHERE id='23';
      UPDATE sip_departamento SET latitud='10.702259', longitud='-71.7411' WHERE id='25';
      UPDATE sip_departamento SET latitud='10.58401', longitud='-66.926651' WHERE id='26';
      UPDATE sip_departamento SET latitud='10.94533', longitud='-65.315041' WHERE id='28';
      UPDATE sip_departamento SET latitud='8.5911358', longitud='-63.9591271' WHERE id='30';
      UPDATE sip_departamento SET latitud='7.893712', longitud='-67.472277' WHERE id='31';
      UPDATE sip_departamento SET latitud='10.250123', longitud='-67.585927' WHERE id='36';
      UPDATE sip_departamento SET latitud='8.62328', longitud='-70.23778' WHERE id='40';
      UPDATE sip_departamento SET latitud='8.330134', longitud='-62.638786' WHERE id='44';
      UPDATE sip_departamento SET latitud='10.152856', longitud='-68.002525' WHERE id='49';
      UPDATE sip_departamento SET latitud='9.65914', longitud='-68.590895' WHERE id='54';
      UPDATE sip_pais SET latitud='6.9455', longitud='-65.6090' WHERE id='862';
      UPDATE sip_departamento SET nombre='NUEVA ESPARTA' WHERE id='14';
    SQL
  end

  def down
    execute <<-SQL
      UPDATE sip_departamento SET latitud=NULL, longitud=NULL WHERE id_pais = '862';
      UPDATE sip_pais SET latitud=NULL, longitud=NULL WHERE id = '862';
    SQL
  end
end
