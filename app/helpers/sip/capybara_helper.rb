
module Sip
  module CapybaraHelper


    # Llamar desde una prueba minitest así:
    #   Sip::CapybaraHelper.iniciar_sesion(self, root_path, 'sip', 'sip')
    # Cambiando sip, sip por el usuario y clave usados para iniciar sesión
    # en sitio de pruebas.
    def iniciar_sesion(prueba, ruta, usuario, clave)
      prueba.visit ruta
      prueba.assert_content 'Pasos de Jesús'
      prueba.click_link 'Iniciar Sesión'
      prueba.assert_content 'Usuario'
      prueba.fill_in('Usuario', with: usuario)
      prueba.fill_in('Clave', with: clave)
      prueba.find_button('Iniciar Sesión').click
      prueba.assert_content 'Sesión iniciada.'
    end
    module_function :iniciar_sesion

  end
end


