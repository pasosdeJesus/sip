require "application_system_test_case"

class IniciarSesionTest < ApplicationSystemTestCase

  test "iniciar sesión" do
    skip
    Sip::CapybaraHelper.iniciar_sesion(
      self, Rails.configuration.relative_url_root, 'sip', 'sip')
  end

end
