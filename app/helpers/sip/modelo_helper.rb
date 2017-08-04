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
      n = self.nombreobj(o, true) + "_path"
      send(n.to_sym)
    end

    # Url para administrar modelo
    def modelos_url(o)
      n = self.nombreobj(o, true) + "_url"
      send(n.to_sym)
    end

    # Ruta para examinar un registro 
    def modelo_path(o)
      n = self.nombreobj(o, !o.id) + "_path"
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
  end
end
