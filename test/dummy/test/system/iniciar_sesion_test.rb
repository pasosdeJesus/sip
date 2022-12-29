require "application_system_test_case"

class IniciarSesionTest < ApplicationSystemTestCase

  test "iniciar sesión" do
    visit Rails.configuration.relative_url_root
    assert_content 'sip'

    Sip::CapybaraHelper.iniciar_sesion(self, root_path, 'sip', 'sip')
  end

end

