class CreaFuncionEdadDeFechanacFecharef < ActiveRecord::Migration[6.0]
  def up
    execute <<-SQL
      CREATE OR REPLACE FUNCTION sip_edad_de_fechanac_fecharef(anionac INTEGER, 
        mesnac INTEGER, dianac INTEGER, anioref INTEGER, mesref INTEGER, 
        diaref INTEGER) RETURNS INTEGER
      AS $$
        SELECT CASE 
          WHEN anionac IS NULL THEN NULL
          WHEN anioref IS NULL THEN NULL
          WHEN mesnac IS NULL OR dianac IS NULL OR mesref IS NULL OR diaref IS NULL THEN 
            anioref-anionac 
          WHEN mesnac < mesref THEN
            anioref-anionac
          WHEN mesnac > mesref THEN
            anioref-anionac-1
          WHEN dianac > diaref THEN
            anioref-anionac-1
          ELSE 
            anioref-anionac
        END 
      $$
      LANGUAGE SQL
      IMMUTABLE;
    SQL
  end

  def down
    execute <<-SQL
      DROP FUNCTION sip_edad_de_fechanac_fecharef;
    SQL
  end
end
