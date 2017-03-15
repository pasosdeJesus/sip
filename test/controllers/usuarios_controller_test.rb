# encoding: UTF-8

require_relative '../test_helper'

module Sip
  class UsuariosControllerTest < ActionDispatch::IntegrationTest
    include Engine.routes.url_helpers
    include Devise::Test::IntegrationHelpers

    PRUEBA_USUARIOSC = {
      nusuario: "admin",
      password: "sjrven123",
      nombre: "admin",
      descripcion: "admin",
      rol: 1,
      idioma: "es_CO",
      email: "usuario1@localhost",
      encrypted_password: '$2a$10$uMAciEcJuUXDnpelfSH6He7BxW0yBeq6VMemlWc5xEl6NZRDYVA3G',
      sign_in_count: 0,
      fechacreacion: "2014-08-05",
      fechadeshabilitacion: nil
    }

    setup do
      @current_usuario = ::Usuario.create(PRUEBA_USUARIOSC)
      sign_in @current_usuario
    end


    test "should have a current_user" do
      assert @current_usuario
    end

    # Atributos mínimos para crear un usuario válido.
    ATRIBUTOS_VALIDOS = { 
      nombre: "n",
      nusuario: 'nusuario',
      email: 'x@x.org',
      fechacreacion: '2014-1-1',
      encrypted_password: 'x',
      created_at: "2014-11-11" 
    }

    ATRIBUTOS_INVALIDOS = { 
      nombre: '',
      nusuario: '',
      created_at: '2014-11-11' 
    }

    test "index: asigna todos los usuarios como @usuarios" do
      if ::Usuario.where(nusuario: 'nusuario').count > 0 
        usuario = ::Usuario.where(nusuario: 'nusuario').take
      else
        usuario = ::Usuario.create! ATRIBUTOS_VALIDOS
      end
      get usuarios_url
    end

    test "get show: asigna el usuario requerido como @usuario" do
      usuario = Usuario.create! ATRIBUTOS_VALIDOS
      get usuario_url(usuario)
      assert_response :success
    end

    test "new: asigna un nuevo usuario como @usuario" do
      get new_usuario_url
      assert_response :success
    end

    test "get edit: asigna el usuario requerido como @usuario" do
      usuario = Usuario.create! ATRIBUTOS_VALIDOS
      get edit_usuario_url(usuario)
      assert_response :success
    end

    test "post create: crea una Usuario" do
      skip
      Usuario.all.delete
      assert_difference('Usuario.count') do
        byebug
        a = ATRIBUTOS_VALIDOS
        a[:fechacreacion_localizada] = a[:fechacreacion]
        post usuarios_url, params: { usuario: a }
        puts @response.body
      end
      assert_redirected_to usuario_url(Usuario.last)
    end

    test "asigna el usuario recien creado como @usuario" do
      skip
      post usuarios_url, params: { usuario: ATRIBUTOS_VALIDOS }
      usuario = Usuario.where(nusuario: 'nusuario').take
      usuario.destroy!
    end

    test "redirige al usuario creado" do
      skip
      post :create, {:usuario => ATRIBUTOS_VALIDOS}, valid_session
      #assert_equal response.status, 200
      expect(response).to redirect_to(Usuario.last)
      usuario = Usuario.where(nusuario: 'nusuario').take
      usuario.destroy!
    end

    test "errads: asigna un usuario recien creado pero no salvado como @usuario" do
      skip
      post :create, {:usuario => ATRIBUTOS_INVALIDOS}, valid_session
      expect(assigns(:usuario)).to be_a_new(Usuario)
    end

    test "vuelve a presentar la plantilla 'nueva'" do
      skip
      post :create, {:usuario => ATRIBUTOS_INVALIDOS}, valid_session
      expect(response).to render_template("new")
    end

#  describe "PUT update" do
#    describe "con parámetros válidos" do
#      let(:new_attributes) {
#        { minutos: "90", nombre: "nombreact2",
#          fecha: "2014-11-18", created_at: "2014-11-18" }
#      }
#
#      test "actualiza el usuario requerido" do
#        skip
#        usuario = Usuario.create! ATRIBUTOS_VALIDOS
#        put :update, {:id => usuario.to_param, :usuario => new_attributes}, valid_session
#        usuario.reload
#        usuario.destroy!
#        #assert_equal usuario.oficina_id, 1
#      end
#
#      test "asigna el usuario requerido como @usuario" do
#        skip
#        usuario = Usuario.create! ATRIBUTOS_VALIDOS
#        put :update, {:id => usuario.to_param, :usuario => ATRIBUTOS_VALIDOS}, valid_session
#        expect(assigns(:usuario)).to eq(usuario)
#        usuario.destroy!
#      end
#
#      test "redirige al usuario" do
#        skip
#        usuario = Usuario.create! ATRIBUTOS_VALIDOS
#        put :update, {:id => usuario.to_param, :usuario => ATRIBUTOS_VALIDOS}, valid_session
#        expect(response).to redirect_to(usuario)
#        usuario.destroy!
#      end
#    end
#
    test "asinga el usuario como @usuario" do
      skip
      usuario = Usuario.create! ATRIBUTOS_VALIDOS
      put :update, {:id => usuario.to_param, :usuario => ATRIBUTOS_INVALIDOS}, valid_session
      expect(assigns(:usuario)).to eq(usuario)
      usuario.destroy!
    end

    test "vuelve a presentar la plantilla 'editar'" do
      skip
      usuario = Usuario.create! ATRIBUTOS_VALIDOS
      put :update, {:id => usuario.to_param, :usuario => ATRIBUTOS_INVALIDOS}, valid_session
      expect(response).to render_template("edit")
      usuario.destroy!
    end

    test "elimina el usuario requerido" do
      skip
      if Usuario.where(nusuario: 'nusuario').count > 0 
        usuario = Usuario.where(nusuario: 'nusuario').take
      else
        usuario = Usuario.create! ATRIBUTOS_VALIDOS
      end
      expect {
        delete :destroy, {:id => usuario.to_param}, valid_session
      }.to change(Usuario, :count).by(-1)
    end

    test "redirige a la lista de usuarios" do
      skip
      usuario = Usuario.create! ATRIBUTOS_VALIDOS
      delete :destroy, {:id => usuario.to_param}, valid_session
      expect(response).to redirect_to(usuarios_path)
    end

  end
end
