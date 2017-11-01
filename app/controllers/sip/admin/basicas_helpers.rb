# encoding: UTF-8
module Sip
  module Admin
    module BasicasHelpers
      include ActionView::Helpers::TextHelper
      include Sip::ModeloHelper     
  
      # Prepara para rutas de tablas basicas en espacio de nombres
      # /admin para la ruta si se requiere
      def nombreobj_admin(o, plural = false)
        nsing = nombreobj(o)
        nom = plural ? nsing.pluralize : nsing
        if !defined?(request) || request.fullpath.include?("/admin/#{nsing}") ||
          request.fullpath.include?("/admin/#{nsing.pluralize}")
          return 'admin_' + nom
        end
        return nom
      end
  
      # Ruta para administrar tabla basica o
      def admin_basicas_path(o)
        n = self.nombreobj_admin(o, true) + "_path"
        send(n.to_sym)
      end
  
      # Url para administrar tabla basica o
      def admin_basicas_url(o)
        n = self.nombreobj_admin(o, true) + "_url"
        send(n.to_sym)
      end
  
      # Ruta para examinar un registro de tabla basica o
      def admin_basica_path(o)
        n = self.nombreobj_admin(o, !o.id) + "_path"
        return send(n.to_sym, o)
      end
  
      # URL para examinar un registro de tabla basica o
      def admin_basica_url(o, format)
        n = self.nombreobj_admin(o, !o.id) + "_url"
        send(n.to_sym, o, format)
      end
  
      # Ruta para crear un registro de la tabla básica 
      def new_admin_basica_path(o)
        n = "new_" + self.nombreobj_admin(o) + "_path"
        send(n.to_sym)
      end
  
      # Ruta para editar un registro de la tabla básica o
      def edit_admin_basica_path(o)
        n = "edit_" + self.nombreobj_admin(o) + "_path"
        send(n.to_sym, o)
      end
    end
  end
end
