require_relative "../../test_helper"

module Sip
  class UbicacionesControllerTest < ActionDispatch::IntegrationTest
    include Engine.routes.url_helpers
    include Devise::Test::IntegrationHelpers

    setup  do
      if ENV['CONFIG_HOSTS'] != 'www.example.com'
        raise 'CONFIG_HOSTS debe ser www.example.com'
      end
      @current_usuario = ::Usuario.create(PRUEBA_USUARIO)
      sign_in @current_usuario
    end

    test "nuevo: crea una nueva" do
      a = Sip::Ubicacion.new
      skip # Por arreglar en msip cuando en ubicaciones_controller no se requiera id_caso
      get nueva_ubicacion_url
      assert_response :success
      assert_template :new
    end

  end
end
