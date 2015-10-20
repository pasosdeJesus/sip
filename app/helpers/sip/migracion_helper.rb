#encoding: UTF-8 

module Sip
  module MigracionHelper

  # Pone cotejación dada a una columna tipo varchar (longitud long) de una tabla
  def cambiaCotejacion(tabla, columna, long, cotejacion)
      execute <<-SQL
      ALTER TABLE #{tabla}
        ALTER COLUMN #{columna} SET DATA TYPE 
          VARCHAR(#{long}) COLLATE "#{cotejacion}";
      SQL
  end

  end
end
