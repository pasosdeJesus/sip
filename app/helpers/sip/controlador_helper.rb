module Sip
  module ControladorHelper

    # Convierte un arreglo de nombres a diccionario y asigna el valor v
    def asignar_en_diccionario(arreglo, diccionario, v)
      if arreglo.length > 1
        if !diccionario[arreglo[0]]
          diccionario[arreglo[0]] = {}
        end
        asignar_en_diccionario(arreglo[1..-1], diccionario[arreglo[0]], v)
      else
        if arreglo[0] == ''
          if !diccionario['']
             diccionario[''] = []
           end
           diccionario[''].push(v)
         else
           diccionario[arreglo[0]] = v
         end
       end
     end
    module_function :asignar_en_diccionario

    # Convierte parámetros en un arreglo con parejas 
    # {name: nombre,value: valor} a diccionario con parámetros
    def convertir_arrnomval_diccionario(arr)
      diccionario = {}
      arr.each do |d|
        dn = d[:name].split('[').map{|p| p[-1] == ']' ? p[0..-2] : p}
        v = d[:value]
        asignar_en_diccionario(dn, diccionario, v)
      end
      return diccionario
    end
    module_function :convertir_arrnomval_diccionario
 
  end
end
