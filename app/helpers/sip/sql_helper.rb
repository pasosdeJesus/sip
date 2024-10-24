
module Sip
  module SqlHelper

    # Pone cotejación dada a una columna tipo varchar (longitud long) 
    def cambiar_cotejacion(tabla, columna, long, cotejacion)
      execute <<-SQL
      ALTER TABLE #{tabla.to_s}
        ALTER COLUMN #{columna.to_s} SET DATA TYPE 
          VARCHAR(#{long.to_i}) COLLATE "#{cotejacion.to_s}";
      SQL
    end
    module_function :cambiar_cotejacion

    alias_method :cambiaCotejacion, :cambiar_cotejacion
    module_function :cambiaCotejacion


    def ejecuta_sql(sql, eco = false)
      if eco 
        puts "ejecuta_sql: #{sql}"
      end
      Sip::Persona.connection.execute <<-SQL
      #{sql}
      SQL
    end
    module_function :ejecuta_sql


    # Cambia convención para sexo 
    def cambiar_convencion_sexo(convencion_final)
      if !Sip::Persona::CONVENCIONES_SEXO.keys.include?(convencion_final)
        puts "Conveción desconocida: #{convecion_final}"
        exit 1
      end
      convencion_inicial = Sip::Persona::convencion_sexo_abreviada
      if convencion_inicial == convencion_final
        return
      end
      if convencion_final != 'FMS' && convencion_final != 'MHS'
        puts "Se espera cambio  a convencion desconocida #{convencion_final}"
        return
      end
      ejecuta_sql("ALTER TABLE sip_persona DROP CONSTRAINT persona_sexo_check",
                  true);

      # Orden importa por ahora soporta bien FMS -> MHS y MHS->FMS
      if convencion_inicial=='FMS' && convencion_final == 'MHS'
        ejecuta_sql("UPDATE sip_persona SET sexo='H'"\
                   " WHERE sexo='M';", true)
        ejecuta_sql("UPDATE sip_persona SET sexo='M'"\
                   " WHERE sexo='F';", true)
        ejecuta_sql("UPDATE sip_persona SET sexo='S'"\
                   " WHERE sexo='S';", true)
      elsif convencion_inicial=='MHS' && convencion_final == 'FMS'
        ejecuta_sql("UPDATE sip_persona SET sexo='F'"\
                   " WHERE sexo='M';", true)
        ejecuta_sql("UPDATE sip_persona SET sexo='M'"\
                   " WHERE sexo='H';", true)
        ejecuta_sql("UPDATE sip_persona SET sexo='S'"\
                   " WHERE sexo='S';", true)
      end

      ejecuta_sql("ALTER TABLE sip_persona ADD CONSTRAINT persona_sexo_check "\
                  " CHECK (LENGTH(sexo)=1 "\
                  " AND '#{convencion_final}' LIKE '%' || sexo || '%');", true)
    end
    module_function :cambiar_convencion_sexo


    ##
    # Agrega una nueva tabla al listado $t
    #
    # @param string &$t Listado de tablas separadas por ,
    # @param string $nt Nueva tabla por agregar si falta
    #
    # @return string cadena t completada para asegurar tabla
    #/
    def agregar_tabla(t, nt)
      at = t.split(',').map(&:strip)
      if (!at.include? nt.strip)
        at << nt
      end
      t = at.join(",")
    end
    module_function :agregar_tabla

    alias_method :agrega_tabla, :agregar_tabla
    module_function :agrega_tabla

    ##
    # Agrega condición a WHERE en un SELECT de SQL
    #
    # @param unknown &$db   Conexión a base de datos
    # @param string  &$w    cadena con WHERE que se completa
    # @param string  $n     nombre de campo
    # @param string  $v     valor esperado
    # @param string  $opcmp operador de comparación por usar.
    # @param string  $con   con
    #
    # @return string cadena w completada con nueva condición
    def ampliar_where(w, n, v, opcmp = '=', con='AND')
      if (!v || v === '' || $v === ' ') 
        return
      end
      if (w != "") 
        w += " #{con}"
      end
      w += " " + n + opcmp + Sivel2Gen::Caso.connection.quote(v)
    end
    module_function :ampliar_where

    alias_method :consulta_and, :ampliar_where
    module_function :consulta_and

    ##
    # Como la función anterior sólo que el valor no lo pone entre 
    # apostrofes y supone que ya viene escapado el valor $v
    #
    # @param string &$w    cadena con WHERE que se completa
    # @param string $n     nombre de campo
    # @param string $v     valor esperado
    # @param string $opcmp operador de comparación por usar.
    # @param string $con   con
    #
    # @return string cadena w completada con nueva condición
    #/
    def ampliar_where_sinap(w, n, v, opcmp = '=', con = "AND")
      if (w != "") 
        w += " " + con
      end
      w += " " + n + opcmp + v
    end
    module_function :ampliar_where_sinap

    alias_method :consulta_and_sinap, :ampliar_where_sinap
    module_function :consulta_and_sinap


    # Escapa la cadena c para usarla en consulta SQL
    def escapar(c)
      Sivel2Gen::Caso.connection.quote_string(c)
    end
    module_function :escapar

    alias_method :cadena_escapa, :escapar
    module_function :cadena_escapa

    # Escapa el parámetro p (supone que es usable la variable global params)
    def escapar_param(params, p, poromision = '')
      if (p.is_a? String) || (p.is_a? Symbol) then
        params[p] ? escapar(params[p]) : ''
      elsif (p.is_a? Array) && p.length == 1 then
        params[p[0]] ? espacar_cadena(params[p[0]]) : ''
      elsif (p.is_a? Array) && p.length > 1 && params[p[0]] then
        n = params[p[0]]
        i = 1
        while i < (p.length - 2) do
          if n[p[i]] then
            n = n[p[i]]
          else
            return ''
          end
          i += 1
        end
        if n[p[i]] then
          return escapar(n[p[i]])
        else
          return poromision
        end
      else
        return poromision
      end
    end
    module_function :escapar_param

    alias_method :param_escapa, :escapar_param
    module_function :param_escapa

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
    module_function :rehabilita_centropoblado


    # Decide si existe una restricción r en base PostgreSQL
    def existe_restricción_pg?(r)
      c = "SELECT EXISTS("\
        "SELECT * FROM pg_constraint WHERE conname = '#{r}'"\
        ");"
      r=execute(c)
      return r[0]['exists']
    end
    module_function :existe_restricción_pg?

  end
end
