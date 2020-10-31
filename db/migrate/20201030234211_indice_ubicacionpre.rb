class IndiceUbicacionpre < ActiveRecord::Migration[6.0]
  def up
    execute <<-SQL
      -- Para que unnaccent quede IMMUTABLE
      CREATE OR REPLACE FUNCTION f_unaccent(text)
        RETURNS text AS
      $func$
      SELECT public.unaccent('public.unaccent', $1)  
      $func$  LANGUAGE sql IMMUTABLE;

      CREATE INDEX sip_nombre_ubicacionpre_b ON sip_ubicacionpre
      USING gin(to_tsvector('spanish', f_unaccent(nombre)));
   SQL
  end
  def down
    execute <<-SQL
      DROP INDEX sip_nombre_ubicacionpre_b;
      DROP FUNCTION f_unaccent(text);
   SQL
  end
end
