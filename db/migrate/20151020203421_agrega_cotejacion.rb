include Sip::MigracionHelper

class AgregaCotejacion < ActiveRecord::Migration[4.2]

  @@tobs = [
    'sip_clase', 'sip_departamento', 'sip_etiqueta',
    'sip_fuenteprensa', 'sip_municipio', 'sip_oficina', 
    'sip_pais', 'sip_persona_trelacion', 'sip_tclase', 
    'sip_tdocumento', 'sip_trelacion', 'sip_tsitio'
  ]
  @@tnom500 = [
    'sip_fuenteprensa', 'sip_oficina', 'sip_tdocumento'
  ]
  @@tnom200 = [
    'sip_pais'
  ]

  def up
    @@tobs.each do  |t|
      cambiaCotejacion(t, 'observaciones', 5000, 'es_co_utf_8')
    end
    @@tnom500.each do  |t|
      cambiaCotejacion(t, 'nombre', 500, 'es_co_utf_8')
    end
    @@tnom200.each do  |t|
      cambiaCotejacion(t, 'nombre', 200, 'es_co_utf_8')
    end
    cambiaCotejacion('sip_anexo', 'descripcion', 1500, 'es_co_utf_8')
  end

  def down
    @@tobs.each do  |t|
      cambiaCotejacion(t, 'observaciones', 5000, 'default')
    end
    @@tnom500.each do  |t|
      cambiaCotejacion(t, 'nombre', 500, 'default')
    end
    @@tnom200.each do  |t|
      cambiaCotejacion(t, 'nombre', 200, 'default')
    end
    cambiaCotejacion('sip_anexo', 'descripcion', 1500, 'default')
  end
end
