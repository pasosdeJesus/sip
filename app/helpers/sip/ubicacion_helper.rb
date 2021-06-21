#encoding: UTF-8 

module Sip
  module UbicacionHelper

    def formato_ubicacion_partes(pais_id, departamento_id, municipio_id, 
      clase_id, con_clase, con_pais)
      r = "";
      if pais_id.nil? || Sip::Pais.where(id: pais_id).count != 1
        return r
      end
      if con_pais 
        r = Sip::Pais.find(pais_id).nombre 
      end
      if departamento_id.nil? || 
        Sip::Departamento.where(id_pais: pais_id, 
                                id: departamento_id).count != 1
        return r
      end
      if con_pais
        r += " / "
      end
      r += Sip::Departamento.where(id: departamento_id).take.nombre
      if municipio_id.nil? || 
        Sip::Municipio.where(id_departamento: departamento_id,
                             id: municipio_id).count != 1
        return r
      end
      r += " / " + Sip::Municipio.where(id: municipio_id).take.nombre
      if !con_clase || clase_id.nil? || 
        Sip::Clase.where(id_municipio: municipio_id,
                                id: clase_id).count != 1
        return r
      end
      r += " / " + Sip::Clase.where(id: clase_id).take.nombre
      r
    end
    module_function :formato_ubicacion_partes

    def formato_ubicacion u, con_clase = true, con_pais = true
      if u.nil?
        return ""
      end
      formato_ubicacion_partes((u ? u.id_pais : nil), 
                               (u ? u.id_departamento : nil), 
                               (u ? u.id_municipio : nil),
                               (u ? u.id_clase : nil), con_clase, con_pais)
    end
    module_function :formato_ubicacion

  end
end
