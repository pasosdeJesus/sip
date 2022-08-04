require 'test_helper'

# Esta prueba supone que en la tabla básica hay un registro con id 1
# Si no lo hay agregar skip a pruebas que lo suponen o crear registro
# con id 1 en las mismas o en setup

module Sip
  module Admin
    class EstadossolControllerTest < ActionDispatch::IntegrationTest
      ESTADOSOL_NUEVA = {
        nombre: 'X',
        observaciones: 'y',
        fechacreacion: '2022-06-23',
        fechadeshabilitacion: nil,
        created_at: '2022-06-23',
        updated_at: '2022-06-23',
      }

      include Rails.application.routes.url_helpers
      include Devise::Test::IntegrationHelpers

      def filtra_doble_ruta_relativa(s)
        return s
      end

      setup do
        @current_usuario = ::Usuario.find(1)
        sign_in @current_usuario
      end

      # Cada prueba se ejecuta en una transacción de la base de datos
      # que después de la prueba se revierte. Por lo que no
      # debe preocuparse por restaurar/borrar lo que modifique/elimine/agregue
      # en cada prueba.

      test "debe presentar listado" do
        get filtra_doble_ruta_relativa(sip.admin_estadossol_path)
        assert_response :success
        assert_template :index
      end

      test "debe presentar resumen de existente" do
        get filtra_doble_ruta_relativa(sip.admin_estadosol_path(Estadosol.find(1)))
        assert_response :success
        assert_template :show
      end

      test "debe presentar formulario para nueva" do
        get filtra_doble_ruta_relativa(sip.new_admin_estadosol_path)
        assert_response :success
        assert_template :new
      end

      test "debe crear nueva" do
        if Sip::Estadosol.where(nombre: 'X').count > 0
          Sip::Estadosol.where(nombre: 'X').destroy_all
        end
        assert_difference('Estadosol.count') do
          post filtra_doble_ruta_relativa(sip.admin_estadossol_path), params: { 
            estadosol: ESTADOSOL_NUEVA
          }
          puts response.body
        end

        assert_redirected_to filtra_doble_ruta_relativa(sip.admin_estadosol_path(
          assigns(:estadosol)))
      end

      test "debe actualizar existente" do
        patch filtra_doble_ruta_relativa(sip.admin_estadosol_path(
          Estadosol.find(1))),
          params: { estadosol: { nombre: 'YY'}}

          assert_redirected_to filtra_doble_ruta_relativa(sip.admin_estadosol_path(
          assigns(:estadosol)))
      end

      test "debe eliminar" do
        skip
        assert_difference('Estadosol.count', -1) do
          delete filtra_doble_ruta_relativa(sip.admin_estadosol_path(Estadosol.find(1)))
        end

        assert_redirected_to filtra_doble_ruta_relativa(sip.admin_estadossol_path)
      end
    end
  end
end
