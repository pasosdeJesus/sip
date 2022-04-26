
# Ayudadores para Bootstrap 5 basados en los ayudaddores para 
# Bootstrap 3 de la gema twitter-bootstrap-rails
module Sip
  module BootstrapHelper


    # Genera grupo de menus
    def grupo_menus(opciones={}, &bloque)
      adclases = ['navbar-nav', 'me-auto']
      if (opciones[:pull] && opciones[:pull] == :right) ||
        (opciones[:empujar] && opciones[:empujar] == :derecha)
        adclases << 'ms-auto'
        adclases.delete('me-auto')
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
        r = content_tag(:li) do
          link_to opcionmenu, url, cop.merge({class: 'dropdown-item'})
        end
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


    # Opción de un menú dashboardkit
    def opcion_menu_dk(opcionmenu, url, opciones={})
      cop = opciones.clone
      if cop[:desplegable] || cop[:dropdown]
        cop.delete(:desplegable)
        cop.delete(:dropdown)
        r = link_to opcionmenu, url, cop.merge({class: 'dropdown-item'})
      else
        r = content_tag(:li, class: 'pc-item') do
          link_to opcionmenu, url, cop.merge({class: 'pc-link'})
        end
      end
      return r
    end 
    module_function :opcion_menu_dk

    # Genera grupo de menus
    def despliega_abajo(opcionmenu, &bloque)
      opab = opcionmenu.gsub(' ', '_')
      r = content_tag(:li, class: 'nav-item dropdown') do
        link_to(opcionmenu, '#', class: 'nav-link dropdown-toggle',
               id: 'navbarDropdown' + opab,
               role: 'button',
               'data-bs-toggle' => 'dropdown',
               'aria-expanded' => false) +
        content_tag(:ul, class: 'dropdown-menu dropdown-menu-light', 
                      'aria-labelledby' => 'navbarDropdown' + opab, &bloque)
      end
      return r
    end 
    module_function :despliega_abajo

    alias_method :drop_down, :despliega_abajo
    module_function :drop_down


    def despliega_abajo_dk(opcionmenu, url, opciones={}, &bloque)
      copiaop = opciones
      opab = opcionmenu.gsub(' ', '_')
      maticon = 'home'
      if  opciones[:maticon]
        maticon = opciones[:maticon]
        copiaop.delete(:maticon)
      end
      claseli = 'pc-item'
      flecha = ''
      if  !opciones.keys.include?(:sinflecha)
        flecha = content_tag(:span, class: 'pc-arrow') do
          content_tag(:i, "data-feather" => 'chevron-right') do
          end
        end
        claseli += ' pc-hasmenu'
      else 
        copiaop.delete(:sinflecha)
      end
      leyenda = false
      if opciones[:leyenda]
        leyenda = true
        claseli += ' pc-caption'
      end

      r = content_tag(:li, class: claseli) do
        if leyenda
           #content_tag(:span, class: 'pc-micon') do
            content_tag(:label) do
              opcionmenu
            end
           #end

        else

          link_to(
            url, copiaop.merge({class: 'pc-link',
                                id: 'navbarDropdown' + opab})
          ) do
            s = ''
            if !bloque.nil?
            end

            content_tag(:span, class: 'pc-micon') do
              content_tag(:i, class: 'material-icons-two-tone') do
                maticon
              end
            end + content_tag(:span, class: 'pc-mtext') do
              opcionmenu
            end + flecha
          end + content_tag(:ul, class: 'pc-submenu', &bloque)
        end
      end
      return r
    end 
    module_function :opcion_menu_dk


    # Genera grupo de menus
    def grupo_menus_dk(opciones={}, &bloque)
      adclases = ['pc-navbar']
      r = content_tag(:ul, class: adclases, &bloque)
      return r
    end 
    module_function :grupo_menus_dk

 

    def barra_navegacion(opciones, &bloque)
      r = content_tag(:nav, 
                      class: 'navbar navbar-expand-lg navbar-light bg-light') do
        content_tag(:div,
                    class: 'container-fluid') do 
          r2 = ''
          if  opciones[:marca] || opciones[:brand]
            r2 += link_to(
              opciones[:marca] ? opciones[:marca] : opciones[:brand],
              opciones[:enlace_marca] ? opciones[:enlace_marca] : 
              opciones[:brand_link], 
              class: 'navbar-brand') 
          end
          r2 += content_tag(
            :button, 
            class: 'navbar-toggler', 
            type: 'button',
            'data-bs-toggle' => 'collapse',
            'data-bs-target' => '#navbarSupportedContent',
            'aria-controls' => 'navbarSupportedContent',
            'aria-expanded' => false,
            'aria-label' => 'Intercambiar navegación'
          ) do
            content_tag(:span, '', class: 'navbar-toggler-icon')
          end
          r2 += content_tag(:div, class: 'collapse navbar-collapse', 
                            id: 'navbarSupportedContent', &bloque)
          r2.html_safe
        end
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
        r << content_tag(
          :div, class: "alert alert-#{tal.to_s} "\
          "alert-dismissible fade show", 
          role: :alert
        ) do
          content_tag(:span, mensaje) + 
            content_tag(
              :button, type: :button, class: 'btn-close', 
              'data-bs-dismiss' =>  :alert,
              'aria-label' => "Close"
            ) do
            end
        end
      end 

      return r.html_safe
    end
    module_function :anuncios_bootstrap

    alias_method :bootstrap_flash, :anuncios_bootstrap
    module_function :bootstrap_flash

    # Sección colapsable dentro de un div con clase accordion
    # @param acid Id del acorden
    # @param idit Id del item
    # @param titulo Titulo del item
    # @param expandido booleano para que inicie expandido
    # @param bloque Que se presenta al expandir
    def item_acordeon_bs(
      acid, idit, titulo, expandido = false, opciones = {}, &bloque)
      r = content_tag(
        :div, 
        class: 'accordion-item ' + opciones.fetch("clase_accordion-item", '')
      ) do
        content_tag(
          :h5, 
          class: 'accordion-header mb-0 ' + opciones.fetch(
            "clase_accordion-header", ''), 
          id: 'enc_' + idit,
          style: opciones.fetch('estilo_accordion-header', nil)
        ) do 
          content_tag(
            :button, 
            class: 'accordion-button ' + (
              expandido ? '' : 'collapsed '
            ) + opciones.fetch(
              "clase_accordion-button", ''
            ), 
            type: 'button',
            'data-bs-toggle' => 'collapse',
            'data-bs-target' => '#' + idit,
            'aria-expanded' => (expandido ? 'true' : 'false'),
            'aria-controls' => idit,
            style: opciones.fetch("estilo_accordion-button", nil),
            id: 'enc_' + idit
          ) do 
            titulo
          end
        end + 
        content_tag(
          :div, 
          class: 'accordion-collapse collapse ' + (
            expandido ? 'show ' : ''
          ) + (
            opciones.fetch("clase_accordion-collapse", '')
          ), 
          "aria-labelledby" => "enc_#{idit}",
          "data-bs-parent" => acid,
          id: idit
        ) do 
          content_tag(
            :div, 
            class: 'accordion-body ' + (
              opciones.fetch("clase_accordion-body", '') 
            ),
            style: opciones.fetch("estilo_accordion-body",nil) 
          ) do 
            yield bloque
          end
        end
      end
    end
    module_function :item_acordeon_bs

    # Encabezado de pestaña.  Debe tener un contenido_pestaña_bs
    # Va dentro de un <ul class="nav nav-tabs" role="tablist">
    # @param idit Id del item
    # @param titulo Titulo del item
    # @param elegida booleano para que inicie enfocado
    # @param bloque Que se presenta al expandir
    def item_nav_pestaña_bs(idit, titulo, elegida = false, 
                               clase_boton = '', &bloque)
      r = content_tag(
        :li, 
        class: 'nav-item',
        role: 'presentation'
      ) do 
        content_tag(
          :button,
          class: "nav-link #{clase_boton} #{elegida ? 'active' : ''}",
          id: "#{idit}-pestana",
          "aria-selected" => (elegida ? 'true' : 'false'),
          "aria-controls" => idit,
          role: "tab",
          "data-bs-toggle" => "tab",
          "data-bs-target" => '#' + idit,
          type: "button"
        ) do
          titulo
        end
      end
    end
    module_function :item_nav_pestaña_bs

    # Contenido de una pestaña. Debe tener un item_nav_pestaña_bs
    # Va dentro de un <ul class="nav nav-tabs" role="tablist">
    # @param idit Id del item
    # @param elegida booleano para que inicie enfocada
    # @param bloque Que se presenta al expandir
    def contenido_pestaña_bs(idit, elegida = false, &bloque)
      content_tag(
        :div,
        class: "tab-pane fade #{elegida ? 'show active' : ''}",
        role: "tabpanel",
        id: idit,
        "aria-labelledby" => idit + "-pestana"
      ) do
        yield bloque
      end
    end
    module_function :contenido_pestaña_bs

    # Caja de verificación.
    # @param idit Id del item
    # @param clase_div Clase para div envolvente
    # @param valor Valor de la caja de verificacion true o false
    # @param at_nombre Atributo nombre para el elemento input
    # @param etiqueta Titulo por presentar
    # @param opciones Si se presentará ayuda emergente poner el 
    #    texto en `ayuda_emergente: el texto`
    def caja_de_verificacion_bs(idit, clase_div, valor, at_nombre, 
                                etiqueta, opciones = {})
      content_tag(
        :div,
        class: "form-check" # optional #{clase_div}"
      ) do
        at_input2 = {
          "data-toggle" => 'tooltip',
          class: 'form-check-input',
          type: "checkbox",
          name: at_nombre,
          id: idit,
          "data-bs-original-title" => opciones.fetch('ayuda_emergente',nil),
          "aria-label" => opciones.fetch('ayuda_emergente', nil),
          style: opciones.fetch('estilo_input', nil)
        }
        if valor
          at_input2[:checked]='on'
        end
        hidden_field_tag( # Truco para que quede en 0 cuando no este chequeada
                         # que llamamos comportamiento rails y es opouesto
                         # al comportamiento estándar de no enviar 
                         # parámetro de campos no marcados.
          at_nombre, '0'
        ) + text_field_tag(
          at_nombre,
          nil,
          at_input2
        ) + content_tag(
          :label,
          class: 'form-check-label',
          for: idit
        ) do
          etiqueta
        end
      end # div
    end
    module_function :caja_de_verificacion_bs


    def barra_navegacion_prosidebar(opciones, &bloque)
      fondo = ''.html_safe
      if opciones[:imagen_barra_lateral]
        fondo = content_tag(
          :div, class: 'image-wrapper'
        ) do 
          content_tag(
            :img, src: opciones[:imagen_barra_lateral], 
            alt: 'sidebar background'
          )
        end
      end

      titulo = opciones[:titulo] ? opciones[:titulo] : Sip.titulo
      spantitulo = content_tag(
        :span, style: 'text-transform: uppercase;'\
        ' font-size: 15px;'\
        'letter-spacing: 3px; '\
        'font-weight: bold;'
      ) do
        if opciones[:enlace_marca] then
          link_to(titulo,
                  opciones[:enlace_marca],
                  class: 'navbar-brand')
        else
          titulo
        end
      end

      r = content_tag(
        :aside, id: 'sidebar', 
        class: 'sidebar break-point-lg has-bg-image collapsed'
      ) do
        fondo +
        content_tag(
          :div, class: 'sidebar-layout'
        ) do 
          r2 = content_tag(:div, class: 'sidebar-header') do
            spantitulo
          end 
          r2 += content_tag(:div, id: 'navbarSupportedContent', &bloque)
          r2 += content_tag(:div, class: 'sidebar-footer') do
            content_tag(:a, id: 'btn-collapse', href: '#') do
              "<i class='ri-swap-box-fill ri-xl'></i>".html_safe
            end 
          end
          r2.html_safe
        end # sidebar-layout
      end +  # aside
      content_tag(
        :a, id: 'btn-toggle', href: '#',
        class: 'sidebar-toggler break-point-lg'
      ) do
        "<i class='ri-swap-box-fill ri-xl'></i>".html_safe
      end

      r.html_safe
    end
    module_function :barra_navegacion_prosidebar


    # Genera grupo de menus prosidebar
    def grupo_menus_prosidebar(opciones={}, &bloque)
      return content_tag(
        :div,
        class: "sidebar-content"
      ) do
        content_tag(
          :nav,
          class: "menu open-current-submenu"
        ) do
          content_tag(:ul, &bloque)
        end
      end
    end 
    module_function :grupo_menus_prosidebar


    # Genera grupo de menus
    def despliega_abajo_prosidebar(
      opcionmenu, iconomenu=nil, iconoexp=nil, &bloque)
      ia = ''.html_safe
      if iconomenu
        ia = content_tag(:span, class: 'menu-icon') do
          content_tag(:i, class: iconomenu.to_s) do
          end
        end
      end
      return content_tag(:li, class: 'menu-item sub-menu') do
        link_to('#') do
          ia + content_tag(:span, class: 'menu-title') do
            opcionmenu
          end + content_tag(:span, class: 'menu-suffix') do
            if iconoexp
              iconoexp.html_safe
            else
              ''.html_safe
            end
          end
        end +
        content_tag(:div, class: 'sub-menu-list') do 
          content_tag(:ul,&bloque)
        end
      end
    end 
    module_function :despliega_abajo_prosidebar


    # Genera opcion menú
    def opcion_menu_prosidebar(opcionmenu, url, opciones={})
      ia = ''.html_safe
      if opciones[:icono]
        ia = content_tag(:span, class: 'menu-icon') do
          content_tag(:i, class: opciones[:icono].to_s) do
          end
        end
      end
      return content_tag(:li, class: 'menu-item') do
        link_to(url) do
          ia + content_tag(:span, class: 'menu-title') do
            opcionmenu
          end
        end
      end
    end 
    module_function :opcion_menu_prosidebar



  end
end
