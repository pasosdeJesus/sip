require_relative "../../../test_helper"
require_relative "../../../models/sip/tclase_test"

module Sip
  class TclasesControllerTest < ActionDispatch::IntegrationTest
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
      get admin_tclases_url
      assert_response :success
      assert_template :index
    end

    test "presenta plantilla de indice filtradas por termino" do
      get admin_tclases_url, params: {term: 'x'}
      assert_response :success
      assert_template "index"
    end

    test "presenta plantilla admin/basicas/index" do
      get admin_tclases_url
      assert_template "sip/modelos/index"
    end

    test "show: muestra un registro" do
      tclase = Sip::Tclase.all.take
      get admin_tclase_url(tclase)
      assert_response :success
      assert_template :show
    end

    test "new: formulario de nueva" do
      get new_admin_tclase_url
      assert_response :success
      assert_template :new
    end

    test "edit: formulario de edición" do
      tclase = Sip::Tclase.all.take
      get edit_admin_tclase_url(tclase)
      assert_response :success
      assert_template :edit
    end

    test "post: crea un registro" do
      assert_difference('Sip::Tclase.count') do
        post admin_tclases_url, params: {tclase: PRUEBA_TCLASE}
        #puts response.body
      end
      assert_redirected_to sip.admin_tclase_path(
        assigns(:tclase)
      )
    end

    test "post: redirige al registro creado" do
      post admin_tclases_url, params: { tclase: PRUEBA_TCLASE}
      assert_response :found
    end

    test "vuelve a plantilla nueva cuando hay errores de validación" do
      atc = PRUEBA_TCLASE.clone
      atc[:nombre] = ''
      post admin_tclases_url, params: { tclase: atc }
      assert_template "new"
    end

    test "debe actualizar existente" do
      nuevotclase = Sip::Tclase.create!(PRUEBA_TCLASE)
      patch sip.admin_tclase_path(nuevotclase.id),
        params: { 
          tclase: { 
            id: nuevotclase.id,
            nombre: 'xyz'
          }
        }

      assert_redirected_to sip.admin_tclase_path(assigns(:tclase))
    end

    test "crear y eliminar" do
      assert_difference('Sip::Tclase.count') do
        post admin_tclases_url, params: {tclase: PRUEBA_TCLASE}
        #puts response.body
      end
      assert_redirected_to sip.admin_tclase_path(
        assigns(:tclase)
      )
      idr = response.body.gsub(/.*tclases\//, "").gsub(/">.*/, "")

      assert_difference('Tclase.count', -1) do
        delete sip.admin_tclase_path(Tclase.find(idr)) # Tclase sin clases
      end

      assert_redirected_to sip.admin_tclases_path
    end

  end
end
