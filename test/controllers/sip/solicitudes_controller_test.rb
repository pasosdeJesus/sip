require 'test_helper'

module Sip
  class SolicitudesControllerTest < ActionDispatch::IntegrationTest

    include Rails.application.routes.url_helpers
    include Devise::Test::IntegrationHelpers

    setup  do
      if ENV['CONFIG_HOSTS'] != 'www.example.com'
        raise 'CONFIG_HOSTS debe ser www.example.com'
      end
      @current_usuario = ::Usuario.find(1)
      sign_in @current_usuario
      @solicitud = Sip::Solicitud.create!(PRUEBA_SOLICITUD)
    end

    # Cada prueba que se ejecuta se hace en una transacción
    # que después de la prueba se revierte

    test "debe presentar listado" do
      get sip.solicitudes_path
      assert_response :success
      assert_template :index
    end

    test "debe presentar resumen de existente" do
      get sip.solicitud_url(@solicitud.id)
      assert_response :success
      assert_template :show
    end

    test "debe presentar formulario para nueva" do
      get sip.new_solicitud_path
      assert_response :success
      assert_template :new
    end

    test "debe presentar formulario de edición" do
      get sip.edit_solicitud_path(@solicitud)
      assert_response :success
      assert_template :edit
    end

    test "debe crear nueva" do
      # Arreglamos indice
      Sip::Solicitud.connection.execute <<-SQL
        SELECT setval('public.sip_solicitud_id_seq', MAX(id)) 
          FROM public.sip_solicitud;
      SQL
      assert_difference('Solicitud.count') do
        post sip.solicitudes_path, params: { 
          solicitud: { 
            id: nil,
            solicitud: 'ZZ',
            usuario_id: 1,
            fecha: '2022-06-24'
          }
        }
      end

      assert_redirected_to sip.solicitud_path(
        assigns(:solicitud))
    end

    test "debe actualizar existente" do
      patch sip.solicitud_path(@solicitud.id),
        params: { 
          solicitud: { 
            id: @solicitud.id,
            solicitud: 'YY'
          }
        }

      assert_redirected_to sip.solicitud_path(assigns(:solicitud))
    end

    test "debe eliminar" do
      assert_difference('Solicitud.count', -1) do
        delete sip.solicitud_path(Solicitud.find(1))
      end

      assert_redirected_to sip.solicitudes_path
    end

  end
end
