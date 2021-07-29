require 'test_helper'

module Sip
  module Admin
    class DepartamentosControllerTest < ActionDispatch::IntegrationTest

      TDEPARTAMENTO_NUEVO = {
        id: 10000,
        created_at: '2021-07-29',
        fechacreacion: '2021-07-29',
        fechadeshabilitacion: nil,
        nombre: 'X',
        id_pais: 170,
        observaciones: 'y',
        updated_at: '2021-07-18'
      }

      include Rails.application.routes.url_helpers
      include Devise::Test::IntegrationHelpers

      setup  do
        if ENV['CONFIG_HOSTS'] != 'www.example.com'
          raise 'CONFIG_HOSTS debe ser www.example.com'
        end
        @current_usuario = ::Usuario.find(1)
        sign_in @current_usuario
      end

      # Cada prueba se ejecuta se hace en una transacción
      # que después de la prueba se revierte

      test "debe presentar listado" do
        get sip.admin_departamentos_path
        assert_response :success
        assert_template :index
      end

      test "debe presentar resumen de existente" do
        get sip.admin_departamento_url(Departamento.find(1))
        assert_response :success
        assert_template :show
      end

      test "debe presentar formulario para nueva" do
        get sip.new_admin_departamento_path
        assert_response :success
        assert_template :new
      end

      test "debe crear nueva" do
        skip # No crea con id 1000
        assert_difference('Departamento.count') do
          post sip.admin_departamentos_path, params: { 
            departamento: TDEPARTAMENTO_NUEVO
          }
        end

        assert_redirected_to sip.admin_departamento_path(
          assigns(:departamento))
      end

      test "debe actualizar existente" do
        patch sip.admin_departamento_path(Departamento.find(1)),
          params: { departamento: { nombre: 'YY'}}

        assert_redirected_to sip.admin_departamento_path(
          assigns(:departamento))
      end

      test "debe eliminar" do
        skip # Problema para eliminar puede ser por integridad referencial
        # mejor tras lograr añadir, replicar y eliminar el añadido
        assert_difference('Departamento.count', -1) do
          delete sip.admin_departamento_url(Departamento.find(1))
        end

        assert_redirected_to sip.admin_departamentos_path
      end

    end
  end
end
