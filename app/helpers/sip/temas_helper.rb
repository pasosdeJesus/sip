#encoding: UTF-8 

module Sip
  module TemasHelper

    def tema_usuario(current_usuario)
      if !current_usuario || !current_usuario.tema_id
        if Sip::Tema.where(id: 1).count == 1
          t = Sip::Tema.find(1)
        else
          t = Sip::Tema.new(
            nav_ini: Sip.colorom_nav_ini,
            nav_fin: Sip.colorom_nav_fin,
            nav_fuente: Sip.colorom_nav_fuente,
            fondo_lista: Sip.colorom_fondo_lista,
            btn_primario_fondo: Sip.colorom_btn_primario_fondo,
            btn_primario_fuente: Sip.colorom_btn_primario_fuente,
            btn_peligro_fondo: Sip.colorom_btn_peligro_fondo,
            btn_peligro_fuente: Sip.colorom_btn_peligro_fuente,
            btn_accion_fondo: Sip.colorom_btn_accion_fondo,
            btn_accion_fuente: Sip.colorom_btn_accion_fuente,
            alerta_exito_fondo: Sip.colorom_alerta_exito_fondo,
            alerta_exito_fuente: Sip.colorom_alerta_exito_fuente,
            alerta_problema_fondo: Sip.colorom_alerta_problema_fondo,
            alerta_problema_fuente: Sip.colorom_alerta_problema_fuente,
            fondo: Sip.colorom_fondo,
            color_fuente: Sip.colorom_color_fuente,
          )
        end
      else
        t = current_usuario.tema
      end
      return t
    end 
    module_function :tema_usuario

  end
end
