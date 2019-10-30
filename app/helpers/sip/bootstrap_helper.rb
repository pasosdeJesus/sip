#encoding: UTF-8 

module Sip
  module BootstrapHelper

    # Genera grupo de menus
    def grupo_menus(opciones={})
      adclases = ''
      if (opciones[:pull] && opciones[:pull] == :right) ||
        (opciones[:empujar] && opciones[:empujar] == :derecha) ||
        adclases += 'navbar-right'
      end
      r = "<ul class='navbar-nav mr-auto #{adclases}'>"
      r2 = block_given? ? yield : nil
      r += r2.nil? ? '' : r2
      r += "</ul>"
      return r.html_safe
    end 
    module_function :grupo_menus

    alias_method :menu_group, :grupo_menus
    module_function :menu_group

    # Genera opcion menú
    def opcion_menu(opcionmenu, url)
      link_to opcionmenu, url, class: 'dropdown-item' 
    end 
    module_function :opcion_menu

    alias_method :menu_item, :opcion_menu
    module_function :menu_item

    # Genera grupo de menus
    def despliega_abajo(opcionmenu)
      r = "<li class='nav-item dropdown'>" +
      "<a class='nav-link dropdown-toggle' href='#' id='navbarDropdown' role='button' data-toggle='dropdown' aria-haspopup='true' aria-expanded='false'>#{opcionmenu}</a>" +
      "<div class='dropdown-menu' aria-labelledby='navbarDropdown'>" 
      r2 = nil
      r2 = yield if block_given?
      r += r2.nil? ? '' : r2
      r += "</div>" +
      "</li>"
      return r.html_safe
    end 
    module_function :despliega_abajo

    alias_method :drop_down, :despliega_abajo
    module_function :drop_down

  end
end
