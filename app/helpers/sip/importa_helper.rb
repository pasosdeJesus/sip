#encoding: UTF-8 

module Sip
  module ImportaHelper


    def nombre_en_tabla_basica(tbasica, nombre, menserror, 
                               camponombre = 'nombre')
      d = tbasica.where(camponombre => nombre)
      if d.count == 0
        menserror << "No se encontró '#{nombre}' en tabla básica #{tbasica.class} al buscar en el campo #{camponombre}"
        return nil
      elsif d.count > 1
        menserror << "En la tabla básica #{tbasica.class} hay #{d.count} registros cuyo campo #{camponombre} es #{nombre}"
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
      d = Sip::FormatoFechaHelper.fecha_local_colombia_estandar(f)
      if !d
        menserror << "No pudo reconocer fecha #{f}.  "
        return nil
      else
        d = Date.strptime(d, '%Y-%m-%d')
      end
    end
    module_function :fecha_local_colombia_a_date


  end
end
