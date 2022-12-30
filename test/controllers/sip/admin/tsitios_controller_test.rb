require_relative "../../../test_helper"
require_relative "../../../models/sip/tsitio_test"

module Sip
  class TsitiosControllerTest < ActionDispatch::IntegrationTest
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
      get admin_tsitios_url
      assert_response :success
      assert_template :index
    end

    test "presenta plantilla de indice filtradas por termino" do
      get admin_tsitios_url, params: {term: 'x'}
      assert_response :success
      assert_template "index"
    end

    test "presenta plantilla admin/basicas/index" do
      get admin_tsitios_url
      assert_template "sip/modelos/index"
    end

    test "show: muestra un registro" do
      tsitio = Sip::Tsitio.all.take
      get admin_tsitio_url(tsitio)
      assert_response :success
      assert_template :show
    end

    test "new: formulario de nueva" do
      get new_admin_tsitio_url
      assert_response :success
      assert_template :new
    end

    test "edit: formulario de edición" do
      tsitio = Sip::Tsitio.all.take
      get edit_admin_tsitio_url(tsitio)
      assert_response :success
      assert_template :edit
    end

    test "post: crea un registro" do
      assert_difference('Sip::Tsitio.count') do
        post admin_tsitios_url, params: {tsitio: PRUEBA_TSITIO}
        #puts response.body
      end
      assert_redirected_to sip.admin_tsitio_path(
        assigns(:tsitio)
      )
    end

    test "post: redirige al registro creado" do
      post admin_tsitios_url, params: { tsitio: PRUEBA_TSITIO}
      assert_response :found
    end

    test "vuelve a plantilla nueva cuando hay errores de validación" do
      atc = PRUEBA_TSITIO.clone
      atc[:nombre] = ''
      post admin_tsitios_url, params: { tsitio: atc }
      assert_template "new"
    end

    test "debe actualizar existente" do
      nuevotsitio = Sip::Tsitio.create!(PRUEBA_TSITIO)
      patch sip.admin_tsitio_path(nuevotsitio.id),
        params: { 
          tsitio: { 
            id: nuevotsitio.id,
            nombre: 'xyz'
          }
        }

      assert_redirected_to sip.admin_tsitio_path(assigns(:tsitio))
    end

    test "crear y eliminar" do
      assert_difference('Sip::Tsitio.count') do
        post admin_tsitios_url, params: {tsitio: PRUEBA_TSITIO}
        #puts response.body
      end
      assert_redirected_to sip.admin_tsitio_path(
        assigns(:tsitio)
      )
      idof = response.body.gsub(/.*tsitios\//, "").gsub(/">.*/, "").to_i

      assert_difference('Tsitio.count', -1) do
        delete sip.admin_tsitio_path(Tsitio.find(idof)) # Tsitio sin clases
      end

      assert_redirected_to sip.admin_tsitios_path
    end

  end
end
