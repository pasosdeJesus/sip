require_relative "../../../test_helper"

module Sip
  class OficinasControllerTest < ActionDispatch::IntegrationTest
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
      get admin_oficinas_url
      assert_response :success
      assert_template :index
    end

    test "presenta plantilla de indice filtradas por termino" do
      get admin_oficinas_url, params: {term: 'x'}
      assert_response :success
      assert_template "index"
    end

    test "presenta plantilla admin/basicas/index" do
      get admin_oficinas_url
      assert_template "sip/modelos/index"
    end

    test "show: muestra un registro" do
      oficina = Sip::Oficina.all.take
      get admin_oficina_url(oficina)
      assert_response :success
      assert_template :show
    end

    test "new: formulario de nueva" do
      get new_admin_oficina_url
      assert_response :success
      assert_template :new
    end

    test "edit: formulario de edición" do
      oficina = Sip::Oficina.all.take
      get edit_admin_oficina_url(oficina)
      assert_response :success
      assert_template :edit
    end

    test "post: crea un registro" do
      assert_difference('Sip::Oficina.count') do
        post admin_oficinas_url, params: {oficina: PRUEBA_OFICINA}
        #puts response.body
      end
      assert_redirected_to sip.admin_oficina_path(
        assigns(:oficina)
      )
    end

    test "post: redirige al registro creado" do
      post admin_oficinas_url, params: { oficina: PRUEBA_OFICINA}
      assert_response :found
    end

    test "vuelve a plantilla nueva cuando hay errores de validación" do
      atc = PRUEBA_OFICINA.clone
      atc[:nombre] = ''
      post admin_oficinas_url, params: { oficina: atc }
      assert_template "new"
    end

    test "debe actualizar existente" do
      nuevooficina = Sip::Oficina.create!(PRUEBA_OFICINA)
      patch sip.admin_oficina_path(nuevooficina.id),
        params: { 
          oficina: { 
            id: nuevooficina.id,
            nombre: 'xyz'
          }
        }

      assert_redirected_to sip.admin_oficina_path(assigns(:oficina))
    end

    test "crear y eliminar" do
      assert_difference('Sip::Oficina.count') do
        post admin_oficinas_url, params: {oficina: PRUEBA_OFICINA}
        #puts response.body
      end
      assert_redirected_to sip.admin_oficina_path(
        assigns(:oficina)
      )
      idof = response.body.gsub(/.*oficinas\//, "").gsub(/">.*/, "").to_i

      assert_difference('Oficina.count', -1) do
        delete sip.admin_oficina_path(Oficina.find(idof)) # Oficina sin clases
      end

      assert_redirected_to sip.admin_oficinas_path
    end

  end
end
