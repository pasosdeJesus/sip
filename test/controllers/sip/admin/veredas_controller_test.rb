require_relative '../../../test_helper'

# Esta prueba supone que en la tabla básica hay un registro con id 1
# Si no lo hay agregar skip a pruebas que lo suponen o crear registro
# con id 1 en las mismas o en setup

module Sip
  class VeredasControllerTest < ActionDispatch::IntegrationTest
    include Engine.routes.url_helpers
    include Devise::Test::IntegrationHelpers

    VEREDA_NUEVA = {
      nombre: 'X',
      observaciones: 'y',
      municipio_id: 1,
      fechacreacion: '2022-02-14',
      fechadeshabilitacion: nil,
      created_at: '2022-02-14',
      updated_at: '2022-02-14',
    }

    IDEX = 10

    setup do
      if ENV['CONFIG_HOSTS'] != 'www.example.com'
        raise 'CONFIG_HOSTS debe ser www.example.com'
      end
      @current_usuario = ::Usuario.create(PRUEBA_USUARIO)
      sign_in @current_usuario
    end

    # Cada prueba se ejecuta en una transacción de la base de datos
    # que después de la prueba se revierte. Por lo que no
    # debe preocuparse por restaurar/borrar lo que modifique/elimine/agregue
    # en cada prueba.

    test "debe presentar listado" do
      get admin_veredas_path
      assert_response :success
      assert_template :index
    end

    test "debe presentar resumen de existente" do
      get admin_vereda_url(Vereda.find(IDEX))
      assert_response :success
      assert_template :show
    end

    test "debe presentar formulario para nueva" do
      get new_admin_vereda_path
      assert_response :success
      assert_template :new
    end

    test "debe crear nueva" do
      assert_difference('Sip::Vereda.count') do
        post admin_veredas_path, params: { 
          vereda: VEREDA_NUEVA
        }
      end

      assert_redirected_to admin_vereda_path(
        assigns(:vereda))
    end

    test "debe actualizar existente" do
      patch admin_vereda_path(::Sip::Vereda.find(IDEX)),
        params: { vereda: { nombre: 'YY'}}

      assert_redirected_to admin_vereda_path(
        assigns(:vereda))
    end

    test "debe eliminar" do
      r = ::Sip::Vereda.create!(VEREDA_NUEVA)
      assert_difference('Sip::Vereda.count', -1) do
        delete admin_vereda_url(::Sip::Vereda.find(r.id))
      end

      assert_redirected_to admin_veredas_path
    end
  end
end
