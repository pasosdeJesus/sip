class AjustaNombresGeo < ActiveRecord::Migration[7.0]

  REMP=['A', 'De', 'Del', 'O', 'Y' ]
  # Palabras intermedias por pasar a minúscula
  # Hay casos con El, La, Las que nos parece mejor no convertir como
  # Hacienda La Mora o El Corralón

  TABLAS=['sip_departamento', 'sip_municipio', 'sip_clase', 'sip_vereda']

  def up
    execute <<-SQL
      UPDATE sip_vereda SET nombre=INITCAP(nombre);
    SQL
    TABLAS.each do |t|
      REMP.each do |r|
        execute <<-SQL
          UPDATE #{t} SET nombre=replace(nombre, ' #{r} ', ' #{r.downcase} ')
            WHERE nombre LIKE '% #{r} %' AND nombre NOT LIKE ' %- #{r} %';
        SQL
      end
    end
  end

  def down
    TABLAS.each do |t|
      REMP.each do |r|
        execute <<-SQL
          UPDATE #{t} SET nombre=replace(nombre, ' #{r.downcase} ', ' #{r} ')
            WHERE nombre LIKE '% #{r.downcase} %';
        SQL
      end
    end
    execute <<-SQL
      UPDATE sip_vereda SET nombre=UPPER(nombre);
    SQL
  end
end
