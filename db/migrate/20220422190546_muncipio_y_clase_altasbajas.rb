class MuncipioYClaseAltasbajas < ActiveRecord::Migration[7.0]
  def up
    execute <<-SQL
      UPDATE sip_municipio SET nombre=initcap(nombre);
      UPDATE sip_clase SET nombre=initcap(nombre);
    SQL
  end

  def down
    execute <<-SQL
      UPDATE sip_municipio SET nombre=upper(nombre);
      UPDATE sip_clase SET nombre=upper(nombre);
    SQL
  end
end
