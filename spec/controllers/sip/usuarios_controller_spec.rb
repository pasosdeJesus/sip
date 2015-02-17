# encoding: UTF-8

require 'rails_helper'

module Sip
  RSpec.describe UsuariosController, :type => :controller do
    routes { Sip::Engine.routes }

    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:usuario]
      u = build(:usuario)
      controller.stub(:current_usuario).and_return(u)
    end

    it "should have a current_user" do
        expect(subject.current_usuario).not_to be_nil
    end
    # Atributos mínimos para crear un usuario válido.
    let(:valid_attributes) {
      { nombre: "n",
        created_at: "2014-11-11" }
    }

    let(:invalid_attributes) {
      { nombre: "",
        created_at: "2014-11-11" }
    }

    # Atributos mínimos de valores de sesión para pasar filtros (como 
    # autenticación) definidos en UsuarioesController.
    # De http://luisalima.github.io/blog/2013/01/09/how-i-test-part-iv/
    let(:valid_session) { 
      {"warden.user.user.key" => session["warden.user.user.key"]}
    }

    describe "GET index" do
      it "asigna todos los usuarios como @usuarios" do
        usuario = Usuario.create! valid_attributes
        get :index, {}, valid_session
        expect(assigns(:usuarios)).to eq([usuario])
      end
    end

    describe "GET show" do
      it "asigna el usuario requerido como @usuario" do
        usuario = Usuario.create! valid_attributes
        get :show, {:id => usuario.to_param}, valid_session
        expect(assigns(:usuario)).to eq(usuario)
      end
    end

    describe "GET new" do
      it "asigna una nueva usuario como @usuario" do
        get :new, {}, valid_session
        expect(assigns(:usuario)).to be_a_new(Usuario)
      end
    end

    describe "GET edit" do
      it "asigna la usuario requerida como @usuario" do
        usuario = Usuario.create! valid_attributes
        get :edit, {:id => usuario.to_param}, valid_session
        expect(assigns(:usuario)).to eq(usuario)
      end
    end

    describe "POST create" do
      describe "con parámetros validos" do
        it "crea una Usuario" do
          expect {
            post :create, {:usuario => valid_attributes}, valid_session
          }.to change(Usuario, :count).by(1)
        end

        it "asigna la usuario recien creada como @usuario" do
          post :create, {:usuario => valid_attributes}, valid_session
          expect(assigns(:usuario)).to be_a(Usuario)
          expect(assigns(:usuario)).to be_persisted
        end

        it "redirige a la usuario creada" do
          post :create, {:usuario => valid_attributes}, valid_session
          expect(response).to redirect_to(Usuario.last)
        end
      end

      describe "con parámetros invalidos" do
        it "assigns a newly created but unsaved usuario as @usuario" do
          post :create, {:usuario => invalid_attributes}, valid_session
          expect(assigns(:usuario)).to be_a_new(Usuario)
        end

        it "vuelve a presentar la plantilla 'nueva'" do
          post :create, {:usuario => invalid_attributes}, valid_session
          expect(response).to render_template("new")
        end
      end
    end

    describe "PUT update" do
      describe "con parámetros válidos" do
        let(:new_attributes) {
          { minutos: "90", nombre: "nombreact2",
            fecha: "2014-11-18", created_at: "2014-11-18" }
        }

        it "actualiza el usuario requerida" do
          usuario = Usuario.create! valid_attributes
          put :update, {:id => usuario.to_param, :usuario => new_attributes}, valid_session
          usuario.reload
          #expect(usuario.regionsjr_id).to eq(1)
        end

        it "asigna el usuario requerido como @usuario" do
          usuario = Usuario.create! valid_attributes
          put :update, {:id => usuario.to_param, :usuario => valid_attributes}, valid_session
          expect(assigns(:usuario)).to eq(usuario)
        end

        it "redirige a la usuario" do
          usuario = Usuario.create! valid_attributes
          put :update, {:id => usuario.to_param, :usuario => valid_attributes}, valid_session
          expect(response).to redirect_to(usuario)
        end
      end

      describe "con parametros inválidos" do
        it "asinga la usuario como @usuario" do
          usuario = Usuario.create! valid_attributes
          put :update, {:id => usuario.to_param, :usuario => invalid_attributes}, valid_session
          expect(assigns(:usuario)).to eq(usuario)
        end

        it "vuelve a presentar la plantilla 'editar'" do
          usuario = Usuario.create! valid_attributes
          put :update, {:id => usuario.to_param, :usuario => invalid_attributes}, valid_session
          expect(response).to render_template("edit")
        end
      end
    end

    describe "DELETE destroy" do
      it "elimina la usuario requerida" do
        usuario = Usuario.create! valid_attributes
        expect {
          delete :destroy, {:id => usuario.to_param}, valid_session
        }.to change(Usuario, :count).by(-1)
      end

      it "redirige a la lista de usuarioes" do
        usuario = Usuario.create! valid_attributes
        delete :destroy, {:id => usuario.to_param}, valid_session
        expect(response).to redirect_to(usuarioes_url)
      end
    end

  end
end
