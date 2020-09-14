#encoding: UTF-8 

module Sip
  module MigracionHelper

  # Pone cotejación dada a una columna tipo varchar (longitud long) de una tabla
  def cambiaCotejacion(tabla, columna, long, cotejacion)
      execute <<-SQL
      ALTER TABLE #{tabla.to_s}
        ALTER COLUMN #{columna.to_s} SET DATA TYPE 
          VARCHAR(#{long.to_i}) COLLATE "#{cotejacion.to_s}";
      SQL
  end

  end
end
