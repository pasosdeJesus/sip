require 'test_helper'

module Sip
  class UbicacionespreControllerTest < ActionDispatch::IntegrationTest

    include Rails.application.routes.url_helpers
    include Devise::Test::IntegrationHelpers

    setup  do
      if ENV['CONFIG_HOSTS'] != 'www.example.com'
        raise 'CONFIG_HOSTS debe ser www.example.com'
      end
      @current_usuario = ::Usuario.find(1)
      sign_in @current_usuario
      @ubicacionpre = Sip::Ubicacionpre.create!(PRUEBA_UBICACIONPRE)
    end

    # Cada prueba que se ejecuta se hace en una transacción
    # que después de la prueba se revierte

    test "debe presentar listado" do
      get sip.ubicacionespre_path
      assert_response :success
      assert_template :index
    end

    test "debe presentar resumen de existente" do
      get sip.ubicacionpre_path(@ubicacionpre.id)
      assert_response :success
      assert_template :show
    end

    test "debe presentar formulario para nueva" do
      get sip.new_ubicacionpre_path
      assert_response :success
      assert_template :new
    end

    test "debe presentar formulario de edición" do
      get sip.edit_ubicacionpre_path(@ubicacionpre)
      assert_response :success
      assert_template :edit
    end

    test "debe crear nueva" do
      # Arreglamos indice
      Sip::Ubicacionpre.connection.execute <<-SQL
        SELECT setval('public.sip_ubicacionpre_id_seq', MAX(id)) 
          FROM public.sip_ubicacionpre;
      SQL
      assert_difference('Ubicacionpre.count') do
        post sip.ubicacionespre_path, params: { 
          ubicacionpre: { 
            id: nil,
            pais_id: 100,
            departamento_id: 8000,
            nombre: 'IMAGINA2 / BULGARIA',
            nombre_sin_pais: 'IMAGINA2'
          }
        }
      end

      assert_redirected_to sip.ubicacionpre_path(
        assigns(:ubicacionpre))
    end

    test "debe actualizar existente" do
      patch sip.ubicacionpre_path(@ubicacionpre.id),
        params: { 
          ubicacionpre: { 
            id: @ubicacionpre.id,
            nombre: 'IMAGINA3 / BULGARIA', 
            nombre: 'IMAGINA3',
          }
        }

      assert_redirected_to sip.ubicacionpre_path(assigns(:ubicacionpre))
    end

    test "debe eliminar" do
      assert_difference('Ubicacionpre.count', -1) do
        delete sip.ubicacionpre_path(@ubicacionpre.id)
      end

      assert_redirected_to sip.ubicacionespre_path
    end

  end
end
