# Agrega accesores del estilo prefijo_pais_id, prefijo_departamento_id... etc
# A un modelo que tiene un campo ubicacionpre de nombre prefijoubicacionpre_id
#
# Utilizar con extend
module Sip
  module AccesoresUbicacionpre

    # Como prefijo se espera salida, expulsion, destino, llegada
    # y que la tabla tenga el respectivo campo salidaubicacionpre_id,
    # expulsionubicacionpre_id, destinoubicacionpre_id o 
    # llegadaubicacionpre_id.
    def accesores_ubicacionpre(prefijo)
      self.send(:belongs_to, "#{prefijo.to_s}".to_sym,
                class_name: 'Sip::Ubicacionpre', 
                foreign_key: "#{prefijo.to_s}ubicacionpre_id", 
                optional: true)

      self.send(:attr_accessor, "#{prefijo.to_s}_pais_id")
      self.send(:attr_accessor, "#{prefijo.to_s}_departamento_id")
      self.send(:attr_accessor, "#{prefijo.to_s}_municipio_id")
      self.send(:attr_accessor, "#{prefijo.to_s}_clase_id")
      self.send(:attr_accessor, "#{prefijo.to_s}_lugar")
      self.send(:attr_accessor, "#{prefijo.to_s}_sitio")
      self.send(:attr_accessor, "#{prefijo.to_s}_tsitio_id")
      self.send(:attr_accessor, "#{prefijo.to_s}_latitud")
      self.send(:attr_accessor, "#{prefijo.to_s}_longitud")

      define_method("#{prefijo.to_s}_pais_id") do
        self.send("#{prefijo.to_s}") ?
          self.send("#{prefijo.to_s}").pais_id : ''
      end

      self.send(:belongs_to, "#{prefijo.to_s}_pais".to_sym,
                class_name: 'Sip::Pais', 
                foreign_key: "#{prefijo.to_s}_pais_id", 
                optional: true)

      define_method("#{prefijo.to_s}_pais") do
        self.send("#{prefijo.to_s}") ?
          self.send("#{prefijo.to_s}").pais : nil 
      end

      define_method("#{prefijo.to_s}_departamento_id") do
        self.send("#{prefijo.to_s}") ?
          self.send("#{prefijo.to_s}").departamento_id : ''
      end

      define_method("#{prefijo.to_s}_departamento") do
        self.send("#{prefijo.to_s}") ?
          self.send("#{prefijo.to_s}").departamento : nil 
      end

      self.send(:belongs_to, "#{prefijo.to_s}_departamento".to_sym,
                class_name: 'Sip::Departamento', 
                foreign_key: "#{prefijo.to_s}_departamento_id", 
                optional: true)

      define_method("#{prefijo.to_s}_municipio_id") do
        self.send("#{prefijo.to_s}") ?
          self.send("#{prefijo.to_s}").municipio_id : ''
      end

      define_method("#{prefijo.to_s}_municipio") do
        self.send("#{prefijo.to_s}") ?
          self.send("#{prefijo.to_s}").municipio : nil 
      end

      self.send(:belongs_to, "#{prefijo.to_s}_municipio".to_sym,
                class_name: 'Sip::Municipio', 
                foreign_key: "#{prefijo.to_s}_municipio_id", 
                optional: true)

      define_method("#{prefijo.to_s}_clase_id") do
        self.send("#{prefijo.to_s}") ?
          self.send("#{prefijo.to_s}").clase_id : ''
      end

      define_method("#{prefijo.to_s}_clase") do
        self.send("#{prefijo.to_s}") ?
          self.send("#{prefijo.to_s}").clase : nil 
      end

      self.send(:belongs_to, "#{prefijo.to_s}_clase".to_sym,
                class_name: 'Sip::Clase', 
                foreign_key: "#{prefijo.to_s}_clase_id", 
                optional: true)

      define_method("#{prefijo.to_s}_lugar") do
        self.send("#{prefijo.to_s}") ?
          self.send("#{prefijo.to_s}").lugar : ''
      end

      define_method("#{prefijo.to_s}_sitio") do
        self.send("#{prefijo.to_s}") ?
          self.send("#{prefijo.to_s}").sitio : ''
      end

      define_method("#{prefijo.to_s}_tsitio_id") do
        self.send("#{prefijo.to_s}") ?
          self.send("#{prefijo.to_s}").tsitio_id : ''
      end

      define_method("#{prefijo.to_s}_tsitio") do
        self.send("#{prefijo.to_s}") ?
          self.send("#{prefijo.to_s}").tsitio : nil 
      end

      self.send(:belongs_to, "#{prefijo.to_s}_tsitio".to_sym,
                class_name: 'Sip::Tsitio', 
                foreign_key: "#{prefijo.to_s}_tsitio_id", 
                optional: true)


      define_method("#{prefijo.to_s}_latitud") do
        self.send("#{prefijo.to_s}") ?
          self.send("#{prefijo.to_s}").latitud : ''
      end

      define_method("#{prefijo.to_s}_longitud") do
        self.send("#{prefijo.to_s}") ?
          self.send("#{prefijo.to_s}").longitud : ''
      end

    end

  end
end
