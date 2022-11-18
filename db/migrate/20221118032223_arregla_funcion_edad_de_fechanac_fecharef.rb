class ArreglaFuncionEdadDeFechanacFecharef < ActiveRecord::Migration[7.0]
  def up
    # Se sigue implemntación de app/helpers/sip/edad_sexo_helper.rb para que
    # coincida lo hecho en ruby y en SQL
    execute <<-SQL
    CREATE OR REPLACE FUNCTION public.sip_edad_de_fechanac_fecharef(anionac integer, mesnac integer, dianac integer, anioref integer, mesref integer, diaref integer) RETURNS integer
        LANGUAGE sql IMMUTABLE
        AS $$
            SELECT CASE 
              WHEN anionac IS NULL THEN NULL
              WHEN anioref IS NULL THEN NULL
              WHEN anioref < anionac THEN -1
              WHEN mesnac IS NOT NULL AND mesnac > 0 
                AND mesref IS NOT NULL AND mesref > 0 
                AND mesnac >= mesref THEN
                CASE 
                  WHEN mesnac > mesref OR (dianac IS NOT NULL 
                    AND dianac > 0 AND diaref IS NOT NULL 
                    AND diaref > 0 AND dianac > diaref) THEN 
                    anioref-anionac-1
                  ELSE 
                    anioref-anionac
                END
              ELSE
                anioref-anionac
            END 
          $$;
    SQL

  end
  def down
    execute <<-SQL
    CREATE OR REPLACE FUNCTION public.sip_edad_de_fechanac_fecharef(anionac integer, mesnac integer, dianac integer, anioref integer, mesref integer, diaref integer) RETURNS integer
        LANGUAGE sql IMMUTABLE
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
          $$;
    SQL
  end
end
