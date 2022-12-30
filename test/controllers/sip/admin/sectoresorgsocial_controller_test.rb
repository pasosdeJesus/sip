require_relative "../../../test_helper"
require_relative "../../../models/sip/sectororgsocial_test"

module Sip
  class SectoresorgsocialControllerTest < ActionDispatch::IntegrationTest
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
      get admin_sectoresorgsocial_url
      assert_response :success
      assert_template :index
    end

    test "presenta plantilla de indice filtradas por termino" do
      get admin_sectoresorgsocial_url, params: {term: 'x'}
      assert_response :success
      assert_template "index"
    end

    test "presenta plantilla admin/basicas/index" do
      get admin_sectoresorgsocial_url
      assert_template "sip/modelos/index"
    end

    test "new: formulario de nueva" do
      get new_admin_sectororgsocial_url
      assert_response :success
      assert_template :new
    end

    test "edit: formulario de edición" do
    end

    test "post: crea un registro" do
      assert_difference('Sip::Sectororgsocial.count') do
        post admin_sectoresorgsocial_url, params: {sectororgsocial: PRUEBA_SECTORORGSOCIAL}
        #puts response.body
      end
      assert_redirected_to sip.admin_sectororgsocial_path(
        assigns(:sectororgsocial)
      )
    end

    test "post: redirige al registro creado" do
      post admin_sectoresorgsocial_url, params: { sectororgsocial: PRUEBA_SECTORORGSOCIAL}
      assert_response :found
    end

    test "vuelve a plantilla nueva cuando hay errores de validación" do
      atc = PRUEBA_SECTORORGSOCIAL.clone
      atc[:nombre] = ''
      post admin_sectoresorgsocial_url, params: { sectororgsocial: atc }
      assert_template "new"
    end

    test "debe actualizar existente" do
      nuevosectororgsocial = Sip::Sectororgsocial.create!(PRUEBA_SECTORORGSOCIAL)
      patch sip.admin_sectororgsocial_path(nuevosectororgsocial.id),
        params: { 
          sectororgsocial: { 
            id: nuevosectororgsocial.id,
            nombre: 'xyz'
          }
        }

      assert_redirected_to sip.admin_sectororgsocial_path(assigns(:sectororgsocial))
    end

    test "crear presentar editar eliminar" do
      assert_difference('Sip::Sectororgsocial.count') do
        post admin_sectoresorgsocial_url, params: {sectororgsocial: PRUEBA_SECTORORGSOCIAL}
        #puts response.body
      end
      assert_redirected_to sip.admin_sectororgsocial_path(
        assigns(:sectororgsocial)
      )
      idr = response.body.gsub(/.*sectoresorgsocial\//, "").gsub(/">.*/, "").to_i

      sectororgsocial = Sip::Sectororgsocial.all.take
      get admin_sectororgsocial_url(sectororgsocial)
      assert_response :success
      assert_template :show

      get edit_admin_sectororgsocial_url(sectororgsocial)
      assert_response :success
      assert_template :edit

      assert_difference('Sectororgsocial.count', -1) do
        delete sip.admin_sectororgsocial_path(Sectororgsocial.find(idr)) # Sectororgsocial sin clases
      end

      assert_redirected_to sip.admin_sectoresorgsocial_path
    end

  end
end
