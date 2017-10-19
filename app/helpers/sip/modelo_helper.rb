# encoding: UTF-8
module Sip
  module ModeloHelper
    include ActionView::Helpers::TextHelper

    # Retorna nombre de tabla a partir de objeto
    def nombreobj(o, plural=false)
      r = ""
      if defined? o.name
        #r = o.name.downcase
        r = o.name.demodulize.underscore
      else
        #r = o.class.name.underscore.gsub(/\//, '_')
        r = o.class.name.demodulize.underscore
      end
      if r == "relation"
        r = o.name.demodulize.underscore
      end
      r = plural ? r.pluralize : r
      return r
    end

    # Ruta para administrar modelo
    def modelos_path(o)
      if o.respond_to?(:modelos_path) 
        n = o.modelos_path
      elsif o.respond_to?(:klass) && o.klass.respond_to?(:modelos_path)
        n = o.klass.modelos_path
      else
        n = self.nombreobj(o, true) + "_path"
      end
      send(n.to_sym)
    end

    # Url para administrar modelo
    def modelos_url(o)
      n = self.nombreobj(o, true) + "_url"
      send(n.to_sym)
    end

    # Ruta para examinar un registro 
    # En caso de registros no existentes retorna ruta para crearlo con POST
    def modelo_path(o)
      if o.id
        n = self.nombreobj(o, false) + "_path"
      else 
        n = 'crea_' + self.nombreobj(o, true) + "_path"
        if !respond_to?(n)
          n = 'crea_' + self.nombreobj(o, false) + "_path"
          if !respond_to?(n)
            n = self.nombreobj(o, true) + "_path"
          end
        end
      end
      return send(n.to_sym, o)
    end

    # URL para examinar un registro
    def modelo_url(o, format)
      n = self.nombreobj(o, !o.id) + "_url"
      send(n.to_sym, o, format)
    end

    # Ruta para crear un registro
    def new_modelo_path(o)
      n = "new_" + self.nombreobj(o) + "_path"
      send(n.to_sym)
    end

    # Ruta para editar un registro de la tabla básica o
    def edit_modelo_path(o)
      n = "edit_" + self.nombreobj(o) + "_path"
      send(n.to_sym, o)
    end

    def self.poromision(params, s)
      params.nil? ? '' : (params[:filtro].nil? ? '' : params[:filtro][s])
    end 

    # Convierte un atributo a nombre de filtro (dejando solo letras numeros y _)
    def self.nom_filtro(atr)
      return atr.to_s.gsub(/[^a-z_A-Z0-9]/, '')
    end

    # Nombre y apellido de una persona
    def self.nomap_persona(p)
      if p
        r = p.nombres + ' ' + p.apellidos
        return r.strip
      end
      return ""
    end

    # Retorna etiqueta que corresponde a una identificación
    # en una colección al estilo 
    # [['EN EJECUCIÓN', :J], 
    #  ['EN TRAMITE', :E], 
    #  ['RECHAZADO', :R], 
    #  ['TERMINADO', :T]]
    def self.etiqueta_coleccion(a, l)
      return '' if l == ''
      res = a.select do |r|
        r[1].to_s == l.to_s
      end
      if res.length == 0
        return "ERROR-CON-#{a}-Y-#{l}-FAVOR-REPORTAR"
      end
      return res[0][0]
    end

  end
end
