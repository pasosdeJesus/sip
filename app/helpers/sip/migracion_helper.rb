
module Sip
  module MigracionHelper

    # Pone cotejación dada a una columna tipo varchar (longitud long) 
    # de una tabla
    def cambiaCotejacion(tabla, columna, long, cotejacion)
      execute <<-SQL
      ALTER TABLE #{tabla.to_s}
        ALTER COLUMN #{columna.to_s} SET DATA TYPE 
          VARCHAR(#{long.to_i}) COLLATE "#{cotejacion.to_s}";
      SQL
    end

    # Vuelve a habilitar un centro poblado
    # e.g MORALES desapareció de DIVIPOLA 2018 y volvió a aprecer en
    # DIVIPOLA 2020
    def rehabilita_centropoblado(
      id, municipio_id, id_clalocal, nombre, observacion, fechacreacion)

      #byebug
      if Sip::Clase.where(id: id).count > 0
        c = Sip::Clase.find(id)
        if c.id_municipio != municipio_id || c.id_clalocal != id_clalocal || 
            c.nombre != nombre
          puts "Se espera que centro poblado #{id} fuera #{nombre} "\
            " en municipio #{municipio_id} con id_clalocal #{id_clalocal}"
          exit 1
        end
        c.fechadeshabilitacion = nil
        c.observaciones << ((c.observaciones.to_s == '' ? '' : '. ') + observacion)
        c.save!
      else
        c = Sip::Clase.new(
          id: id, 
          id_municipio: municipio_id,
          id_clalocal: id_clalocal,
          nombre: nombre,
          observaciones: observacion,
          fechacreacion: fechacreacion,
          created_at: fechacreacion,
          updated_at: fechacreacion
        )
      end
    end

  end
end
