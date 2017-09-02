class ActualizaDivipola2015 < ActiveRecord::Migration[4.2]
  def up
    execute <<-SQL
      UPDATE sip_municipio SET nombre = 'BOGOTÁ, D.C.' WHERE id = '24';
      UPDATE sip_municipio SET nombre = 'VENECIA' WHERE id = '857';
      UPDATE sip_municipio SET nombre = 'VILLA DE SAN DIEGO DE UBATÉ' WHERE id = '1357';
      UPDATE sip_municipio SET nombre = 'TIQUISIO' WHERE id = '1322';
      UPDATE sip_municipio SET nombre = 'EL TABLÓN DE GÓMEZ' WHERE id = '452';
      UPDATE sip_municipio SET nombre = 'LOS ANDES' WHERE id = '719';
      UPDATE sip_municipio SET nombre = 'SANTIAGO DE TOLÚ' WHERE id = '1331';
      UPDATE sip_municipio SET nombre = 'SANTACRUZ' WHERE id = '1153';
      UPDATE sip_municipio SET nombre = 'SANTA FÉ DE ANTIOQUIA' WHERE id = '727';
      UPDATE sip_municipio SET nombre = 'SANTA BÁRBARA DE PINTO' WHERE id = '1186';
      UPDATE sip_municipio SET nombre = 'SANTA BÁRBARA' WHERE id = '1149';
      UPDATE sip_municipio SET nombre = 'SAN PEDRO DE LOS MILAGROS' WHERE id = '1081';
      UPDATE sip_municipio SET nombre = 'SAN ANDRÉS DE TUMACO' WHERE id = '1345';
      UPDATE sip_municipio SET nombre = 'SAN ANDRÉS DE SOTAVENTO' WHERE id = '1093';
      UPDATE sip_municipio SET nombre = 'SABANAS DE SAN ÁNGEL' WHERE id = '1070';
      UPDATE sip_municipio SET nombre = 'RÍO QUITO' WHERE id = '1012'; 
      UPDATE sip_municipio SET nombre = 'QUIBDÓ' WHERE id = '48'; 
      UPDATE sip_municipio SET nombre = 'URIBE' WHERE id = '630'; 
    SQL
  end

  def down
    raise ActiveRecord::IrreversibleMigration    
  end
end
