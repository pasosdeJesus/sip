#encoding: UTF-8 

# Funciones auxiliares para Fontawesome basadas en las de la gema
# fontawesome-rails.
module Sip
  module FontawesomeHelper

    # Genera grupo de menus
    def icono_fa(nomicon, opciones)
      content_tag(:i, class: "fa fa-#{nomicon}", 'aria-hidde' => true) do
        opciones[:texto] ? opciones[:texto] : opciones[:text]
      end
    end
    module_function :icono_fa

    alias_method :fa_icon, :icono_fa
    module_function :fa_icon
  end
end
