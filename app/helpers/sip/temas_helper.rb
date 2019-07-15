#encoding: UTF-8 

module Sip
  module TemasHelper

    def tema_usuario(current_usuario)
      if !current_usuario || !current_usuario.tema_id
        t = Sip::Tema.new(nav_ini: '266DD3',
          nav_fin: '266DD3',
          nav_fuente: 'FFFFFF',
          fondo_lista: '266DD3')
      else
        t = current_usuario.tema
      end
      return t
    end 
    module_function :tema_usuario

  end
end
