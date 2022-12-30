require 'test_helper'

module Sip
  class BitacorasControllerTest < ActionDispatch::IntegrationTest

    include Rails.application.routes.url_helpers
    include Devise::Test::IntegrationHelpers
    #include Cocoon::ViewHelpers

    setup  do
      if ENV['CONFIG_HOSTS'] != 'www.example.com'
        raise 'CONFIG_HOSTS debe ser www.example.com'
      end
      @current_usuario = ::Usuario.find(1)
      sign_in @current_usuario
      @bitacora = Sip::Bitacora.create!(PRUEBA_BITACORA)
    end

    # Cada prueba que se ejecuta se hace en una transacción
    # que después de la prueba se revierte

    test "debe presentar listado" do
      get sip.bitacoras_path
      assert_response :success
      assert_template :index
    end

    test "debe presentar resumen de existente" do
      get sip.bitacora_url(@bitacora.id)
      assert_response :success
      assert_template :show
    end

    test "debe presentar formulario para nueva" do
      skip # no debe existir arreglar en msip
      get sip.new_bitacora_path
      assert_response :success
      assert_template :new
    end

    test "debe presentar formulario de edición" do
      skip # no debe existir arreglar en msip
      get sip.edit_bitacora_path(@bitacora)
      assert_response :success
      assert_template :edit
    end

    test "debe crear nueva" do
      skip # no debe existir arreglar en msip
    end

    test "debe actualizar existente" do
      skip # no debe existir arreglar en msip
      patch sip.bitacora_path(@bitacora.id),
        params: { 
          bitacora: { 
            id: @bitacora.id,
          }
        }

      assert_redirected_to sip.bitacora_path(assigns(:bitacora))
    end

    test "debe eliminar" do
      skip # no debe existir arreglar en msip
      assert_difference('Bitacora.count', -1) do
        delete sip.bitacora_path(Bitacora.find(1))
      end

      assert_redirected_to sip.bitacoras_path
    end

  end
end
