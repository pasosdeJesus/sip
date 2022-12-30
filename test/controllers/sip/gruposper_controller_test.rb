require_relative "../../test_helper"

module Sip
  class GruposperControllerTest < ActionDispatch::IntegrationTest
    include Engine.routes.url_helpers
    include Devise::Test::IntegrationHelpers

    setup  do
      if ENV['CONFIG_HOSTS'] != 'www.example.com'
        raise 'CONFIG_HOSTS debe ser www.example.com'
      end
      @current_usuario = ::Usuario.create(PRUEBA_USUARIO)
      sign_in @current_usuario
    end

    test "index: presenta plantilla de indice" do
      get gruposper_url, as: :json
      assert_response :success
    end

    test "presenta plantilla de indice filtradas por termino" do
      get gruposper_url, params: {"grupoper" => {"term" => 'x'}}, as: :json
      assert_response :success
    end

  end
end
