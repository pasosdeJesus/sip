require_relative "../../../test_helper"
require_relative "../../../models/sip/municipio_test"

module Sip
  class MunicipiosControllerTest < ActionDispatch::IntegrationTest
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
      get admin_municipios_url
      assert_response :success
      assert_template :index
    end

    test "presenta plantilla de indice filtradas por termino" do
      get admin_municipios_url, params: {term: 'x'}
      assert_response :success
      assert_template "index"
    end

    test "presenta plantilla admin/basicas/index" do
      get admin_municipios_url
      assert_template "sip/modelos/index"
    end

    test "show: muestra un registro" do
      municipio = Sip::Municipio.all.take
      get admin_municipio_url(municipio)
      assert_response :success
      assert_template :show
    end

    test "new: formulario de nueva" do
      get new_admin_municipio_url
      assert_response :success
      assert_template :new
    end

    test "edit: formulario de edición" do
      municipio = Sip::Municipio.all.take
      get edit_admin_municipio_url(municipio)
      assert_response :success
      assert_template :edit
    end

    test "post: crea un registro" do
      assert_difference('Sip::Municipio.count') do
        post admin_municipios_url, params: {municipio: MunicipioTest::PRUEBA_MUNICIPIO}
        #puts response.body
      end
      assert_redirected_to sip.admin_municipio_path(
        assigns(:municipio)
      )
    end

    test "post: redirige al registro creado" do
      post admin_municipios_url, params: { municipio: MunicipioTest::PRUEBA_MUNICIPIO}
      assert_response :found
    end

    test "vuelve a plantilla nueva cuando hay errores de validación" do
      atc = MunicipioTest::PRUEBA_MUNICIPIO.clone
      atc[:nombre] = ''
      post admin_municipios_url, params: { municipio: atc }
      assert_template "new"
    end

    test "debe actualizar existente" do
      nuevomunicipio = Sip::Municipio.create!(MunicipioTest::PRUEBA_MUNICIPIO)
      patch sip.admin_municipio_path(nuevomunicipio.id),
        params: { 
          municipio: { 
            id: nuevomunicipio.id,
            nombre: 'xyz'
          }
        }

      assert_redirected_to sip.admin_municipio_path(assigns(:municipio))
    end

    test "debe eliminar" do
      assert_difference('Municipio.count', -1) do
        delete sip.admin_municipio_path(Municipio.find(323)) # Municipio sin clases
      end

      assert_redirected_to sip.admin_municipios_path
    end

  end
end
