#encoding: UTF-8 

# Ayudadores para Bootstrap 4 basados en los ayudaddores para 
# Bootstrap 3 de la gema twitter-bootstrap-rails
module Sip
  module BootstrapHelper

    # Genera grupo de menus
    def grupo_menus(opciones={}, &bloque)
      adclases = ['navbar-nav', 'mr-auto']
      if (opciones[:pull] && opciones[:pull] == :right) ||
        (opciones[:empujar] && opciones[:empujar] == :derecha)
        adclases << 'navbar-right'
      end
      r = content_tag(:ul, class: adclases, &bloque)
      return r
    end 
    module_function :grupo_menus

    alias_method :menu_group, :grupo_menus
    module_function :menu_group

    # Genera opcion menú
    def opcion_menu(opcionmenu, url, opciones={})
      cop = opciones.clone
      if cop[:desplegable] || cop[:dropdown]
        cop.delete(:desplegable)
        cop.delete(:dropdown)
        r = link_to opcionmenu, url, cop.merge({class: 'dropdown-item'})
      else
        r = content_tag(:li, class: 'nav-item') do
          link_to opcionmenu, url, cop.merge({class: 'nav-link'})
        end
      end
      return r
    end 
    module_function :opcion_menu

    alias_method :menu_item, :opcion_menu
    module_function :menu_item

    # Genera grupo de menus
    def despliega_abajo(opcionmenu, &bloque)
      opab = opcionmenu.gsub(' ', '_')
      r = content_tag(:li, class: 'nav-item dropdown') do
        link_to(opcionmenu, '#', class: 'nav-link dropdown-toggle',
               id: 'navbarDropdown' + opab,
               role: 'button',
               'data-toggle' => 'dropdown',
               'aria-haspopup' => true,
               'aria-expanded' => false) +
        content_tag(:div, class: 'dropdown-menu', 
                      'aria-labelledby' => 'navbarDropdown' + opab, &bloque)
      end
      return r
    end 
    module_function :despliega_abajo

    alias_method :drop_down, :despliega_abajo
    module_function :drop_down

    def barra_navegacion(opciones, &bloque)
      r = content_tag(:nav, 
                      class: 'navbar navbar-expand-lg navbar-light bg-ligt') do
        r2 = ''
        if  opciones[:marca] || opciones[:brand]
          r2 += link_to(
            opciones[:marca] ? opciones[:marca] : opciones[:brand],
            opciones[:enlace_marca] ? opciones[:enlace_marca] : 
            opciones[:brand_link], 
            class: 'navbar-brand') 
        end
        r2 += content_tag(:button, class: 'navbar-toggler', type: 'button',
                   'data-toggle' => 'collapse',
                   'data-target' => '#navbarSupportedContent',
                   'aria-controls' => 'navbarSupportedContent',
                   'aria-expanded' => false,
                   'aria-label' => 'Intercambiar navegación') do
          content_tag(:span, '', class: 'navbar-toggler-icon')
        end
        r2 += content_tag(:div, class: 'collapse navbar-collapse', 
                    id: 'navbarSupportedContent', &bloque)
        r2.html_safe
      end
      r.html_safe
    end
    module_function :barra_navegacion

    alias_method :nav_bar, :barra_navegacion
    module_function :nav_bar

    def anuncios_bootstrap
      r = ''
      flash.each do |tipo, mensaje| 
        case tipo.to_sym
        when :success, :notice
          tal = :success
        else
          tal = :danger
        end
        r << content_tag(:div, class: 'alert alert-' + tal.to_s, 
                         role: :alert) do
          content_tag(:span, mensaje) + 
          content_tag(
            :button, type: :button, class: :close, 'data-dismiss' =>  :alert,
            'aria-label' => "Close") do
              content_tag(:span,  '&times;'.html_safe, 'aria-hidden' => true) 
          end
        end
      end 

      return r.html_safe
    end
    module_function :anuncios_bootstrap

    alias_method :bootstrap_flash, :anuncios_bootstrap
    module_function :bootstrap_flash
  end
end
