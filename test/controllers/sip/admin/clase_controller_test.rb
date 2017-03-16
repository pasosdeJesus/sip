# encoding: utf-8

require_relative "../../../test_helper"
require_relative "../../../models/sip/clase_test"

module Sip
  class ClasesControllerTest < ActionDispatch::IntegrationTest
    include Engine.routes.url_helpers
    include Devise::Test::IntegrationHelpers

    setup  do
      @current_usuario = ::Usuario.create(PRUEBA_USUARIO)
      sign_in @current_usuario
    end

    test "index: presenta plantilla de indice" do
      get admin_clases_url
      assert_template "index"
    end

    test "presenta plantilla de indice filtradas por termino" do
      get admin_clases_url, params: {term: 'x'}
      assert_template "index"
    end

    test "presenta plantilla admin/basicas/index" do
      get admin_clases_url
      assert_template "admin/basicas/index"
    end

    test "show: muestra clase" do
      clase = Sip::Clase.all.take
      get admin_clase_url(clase)
      assert_response :success
    end

    test "new: formulario de nueva" do
      get new_admin_clase_url
      assert_response :success
    end

    test "edit: formulario de edición" do
      clase = Sip::Clase.all.take
      get edit_admin_clase_url(clase)
      assert_response :success
    end

    test "post: crea una clase 1" do
      assert_difference('Sip::Clase.count') do
        post admin_clases_url, params: {clase: ClaseTest::PRUEBA_CLASE}
        #puts response.body
      end
    end

    test "post: redirige a la clase creada" do
      post admin_clases_url, params: { clase: ClaseTest::PRUEBA_CLASE }
      assert_response :found
    end

    test "vuelve a plantilla nueva" do
      atc = ClaseTest::PRUEBA_CLASE.clone
      atc[:nombre] = ''
      post admin_clases_url, params: { clase: atc }
      assert_template "new"
    end

  end
end
