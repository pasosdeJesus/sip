class ColoresTemaCss < ActiveRecord::Migration[6.0]
  def up
    execute <<-SQL
      UPDATE sip_tema 
        SET nav_ini = '#' || nav_ini,
        nav_fin =  '#' || nav_fin,
        nav_fuente =  '#' || nav_fuente,
        fondo_lista =  '#' || fondo_lista
        WHERE nav_ini NOT LIKE '#%';
    SQL
  end
  def down
    execute <<-SQL
      UPDATE sip_tema 
        SET nav_ini = SUBSTRING(nav_ini FROM 2),
        nav_fin =  SUBSTRING(nav_fin FROM 2),
        nav_fuente =  SUBSTRING(nav_fuente FROM 2),
        fondo_lista =  SUBSTRING(fondo_lista FROM 2)
        WHERE nav_ini LIKE '#%';
    SQL
  end

end
