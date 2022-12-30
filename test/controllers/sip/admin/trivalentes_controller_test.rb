require_relative "../../../test_helper"

module Sip
  class TrivalentesControllerTest < ActionDispatch::IntegrationTest
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
      get admin_trivalentes_url
      assert_response :success
      assert_template :index
    end

    test "presenta plantilla de indice filtradas por termino" do
      get admin_trivalentes_url, params: {term: 'x'}
      assert_response :success
      assert_template "index"
    end

    test "presenta plantilla admin/basicas/index" do
      get admin_trivalentes_url
      assert_template "sip/modelos/index"
    end

    test "show: muestra un registro" do
      trivalente = Sip::Trivalente.all.take
      get admin_trivalente_url(trivalente)
      assert_response :success
      assert_template :show
    end

    test "new: formulario de nueva" do
      get new_admin_trivalente_url
      assert_response :success
      assert_template :new
    end

    test "edit: formulario de edición" do
      trivalente = Sip::Trivalente.all.take
      get edit_admin_trivalente_url(trivalente)
      assert_response :success
      assert_template :edit
    end

    test "post: crea un registro" do
      assert_difference('Sip::Trivalente.count') do
        post admin_trivalentes_url, params: {trivalente: PRUEBA_TRIVALENTE}
        #puts response.body
      end
      assert_redirected_to sip.admin_trivalente_path(
        assigns(:trivalente)
      )
    end

    test "post: redirige al registro creado" do
      post admin_trivalentes_url, params: { trivalente: PRUEBA_TRIVALENTE}
      assert_response :found
    end

    test "vuelve a plantilla nueva cuando hay errores de validación" do
      atc = PRUEBA_TRIVALENTE.clone
      atc[:nombre] = ''
      post admin_trivalentes_url, params: { trivalente: atc }
      assert_template "new"
    end

    test "debe actualizar existente" do
      nuevotrivalente = Sip::Trivalente.create!(PRUEBA_TRIVALENTE)
      patch sip.admin_trivalente_path(nuevotrivalente.id),
        params: { 
          trivalente: { 
            id: nuevotrivalente.id,
            nombre: 'xyz'
          }
        }

      assert_redirected_to sip.admin_trivalente_path(assigns(:trivalente))
    end

    test "crear y eliminar" do
      assert_difference('Sip::Trivalente.count') do
        post admin_trivalentes_url, params: {trivalente: PRUEBA_TRIVALENTE}
        #puts response.body
      end
      assert_redirected_to sip.admin_trivalente_path(
        assigns(:trivalente)
      )
      idof = response.body.gsub(/.*trivalentes\//, "").gsub(/">.*/, "").to_i

      assert_difference('Trivalente.count', -1) do
        delete sip.admin_trivalente_path(Trivalente.find(idof)) # Trivalente sin clases
      end

      assert_redirected_to sip.admin_trivalentes_path
    end

  end
end
