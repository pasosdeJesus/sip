
module Sip
  module ImportaHelper


    def nombre_en_tabla_basica(tbasica, nombre, menserror, 
                               camponombre = 'nombre')
      if !nombre  || nombre == ''
        return nil
      end
      d = tbasica.where("upper(unaccent(#{camponombre})) = upper(unaccent(?))",
                        nombre)
      if d.count == 0
        menserror << "  No se encontró '#{nombre}' en tabla básica #{tbasica.to_s} al buscar en el campo #{camponombre}."
        return nil
      elsif d.count > 1
        menserror << "  En la tabla básica #{tbasica.class} hay #{d.count} registros cuyo campo #{camponombre} es #{nombre}."
        return nil
      else # d.count == 1
        return d.take
      end
    end
    module_function :nombre_en_tabla_basica

    # @param f es fecha en formato dd/M/aaaa
    # @param menserror es colchon de mensajes de error.
    # @return objeto Date con fecha de f si no hay error
    # Si hay error reotrna nil y agrega en menserror el error
    def fecha_local_colombia_a_date(f, menserror)
      d = Sip::FormatoFechaHelper.fecha_local_colombia_estandar(f, menserror)
      if !d
        menserror << "  No pudo reconocer fecha #{f}."
        return nil
      else
        d = Date.strptime(d, '%Y-%m-%d')
      end
    end
    module_function :fecha_local_colombia_a_date


    # @param nombre Apellido y nombre
    # @return arreglo con nombre y apellido separados usando heurística simple
    def separa_apellidos_nombres(nombre, menserror)
      apellidos = 'N'
      nombres = 'N'
      n = nombre.gsub(/  */, ' ').gsub(/^ /, '').gsub(/ $/, '')
      p = n.split(' ')
      if p.count == 0
      elsif p.count == 1
        apellidos = p[0]
      elsif p.count == 2
        apellidos = p[0]
        nombres = p[1]
      elsif p.count == 3
        apellidos = p[0] + ' ' + p[1]
        nombres = p[2]
      elsif p.count == 4
        apellidos = p[0] + ' ' + p[1]
        nombres = p[2] + ' ' + p[3]
      elsif p.count == 5
        apellidos = p[0] + ' ' + p[1] + ' ' + p[2]
        nombres = p[3] + ' ' + p[4]
     elsif p.count == 6
        apellidos = p[0] + ' ' + p[1] + ' ' + p[2]
        nombres = p[3] + ' ' + p[4] + ' ' + p[5]
      elsif p.count == 7
        apellidos = p[0] + ' ' + p[1] + ' ' + p[2] + ' ' + p[3]
        nombres = p[4] + ' ' + p[5] + ' ' + p[6]
      else
        menserror = "No se esperaban tantas partes en nombre '#{n}'"
      end
      return [nombres, apellidos]
    end
    module_function :separa_apellidos_nombres

  end
end
