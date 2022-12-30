require_relative "../../../test_helper"

module Sip
  class TrelacionesControllerTest < ActionDispatch::IntegrationTest
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
      get admin_trelaciones_url
      assert_response :success
      assert_template :index
    end

    test "presenta plantilla de indice filtradas por termino" do
      get admin_trelaciones_url, params: {term: 'x'}
      assert_response :success
      assert_template "index"
    end

    test "presenta plantilla admin/basicas/index" do
      get admin_trelaciones_url
      assert_template "sip/modelos/index"
    end

    test "show: muestra un registro" do
      trelacion = Sip::Trelacion.all.take
      get admin_trelacion_url(trelacion)
      assert_response :success
      assert_template :show
    end

    test "new: formulario de nueva" do
      get new_admin_trelacion_url
      assert_response :success
      assert_template :new
    end

    test "edit: formulario de edición" do
      trelacion = Sip::Trelacion.all.take
      get edit_admin_trelacion_url(trelacion)
      assert_response :success
      assert_template :edit
    end

    test "post: crea un registro" do
      assert_difference('Sip::Trelacion.count') do
        post admin_trelaciones_url, params: {trelacion: PRUEBA_TRELACION}
        #puts response.body
      end
      assert_redirected_to sip.admin_trelacion_path(
        assigns(:trelacion)
      )
    end

    test "post: redirige al registro creado" do
      post admin_trelaciones_url, params: { trelacion: PRUEBA_TRELACION}
      assert_response :found
    end

    test "vuelve a plantilla nueva cuando hay errores de validación" do
      atc = PRUEBA_TRELACION.clone
      atc[:nombre] = ''
      post admin_trelaciones_url, params: { trelacion: atc }
      assert_template "new"
    end

    test "debe actualizar existente" do
      nuevotrelacion = Sip::Trelacion.create!(PRUEBA_TRELACION)
      patch sip.admin_trelacion_path(nuevotrelacion.id),
        params: { 
          trelacion: { 
            id: nuevotrelacion.id,
            nombre: 'xyz'
          }
        }

      assert_redirected_to sip.admin_trelacion_path(assigns(:trelacion))
    end

    test "crear y eliminar" do
      assert_difference('Sip::Trelacion.count') do
        post admin_trelaciones_url, params: {trelacion: PRUEBA_TRELACION}
        #puts response.body
      end
      assert_redirected_to sip.admin_trelacion_path(
        assigns(:trelacion)
      )
      idr = response.body.gsub(/.*trelaciones\//, "").gsub(/">.*/, "")

      assert_difference('Trelacion.count', -1) do
        delete sip.admin_trelacion_path(Trelacion.find(idr)) # Trelacion sin clases
      end

      assert_redirected_to sip.admin_trelaciones_path
    end

  end
end
