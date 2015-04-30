require "spec_helper"
require "rails_helper"

describe Sip::Admin::ClasesController do
  routes { Sip::Engine.routes }
  # https://www.relishapp.com/rspec/rspec-rails/docs/controller-specs/engine-routes-for-controllers
  render_views
	
	before(:each) do
		@routes = Sip::Engine.routes
		u = build(:usuario)
		controller.stub(:current_usuario).and_return(u)
	end

  describe "index" do
    it "presenta plantilla de indice" do
      get :index
      expect(response).to render_template("index")
    end
    it "presenta plantilla admin/basicas/index" do
      get :index
      expect(response).to render_template("admin/basicas/index")
    end
  end

  describe "GET show" do
    it "muestra clase" do
      clase = Sip::Clase.all.take
      get :show, {:id => clase.to_param}
      expect(assigns(:clase)).to eq(clase)
    end
  end

  describe "GET new" do
    it "formulario de nueva" do
      get :new, {}
      expect(assigns(:clase)).to be_a_new(Sip::Clase)
    end
  end

  describe "GET edit" do
    it "formulario de edición" do
      clase = Sip::Clase.all.take
      get :edit, {:id => clase.to_param}
      expect(assigns(:clase)).to eq(clase)
    end
  end

  describe "POST create" do
    describe "con parámetros validos" do
      it "crea una clase" do
				atc = FactoryGirl.attributes_for(:sip_clase)
        expect {
          post :create, {:clase => atc}
        }.to change(Sip::Clase, :count).by(1)
				c = Sip::Clase.where(nombre: atc[:nombre]).take
				c.destroy!
      end

      it "crea una clase" do
				atc = FactoryGirl.attributes_for(:sip_clase)
        post :create, {:clase => atc}
        expect(assigns(:clase)).to be_a(Sip::Clase)
        #expect(assigns(:usuario)).to be_persisted
				c = Sip::Clase.where(nombre: atc[:nombre]).take
				c.destroy!
      end

      it "redirige a la clase creada" do
				atc = FactoryGirl.attributes_for(:sip_clase)
        post :create, {:clase=> atc}
        expect(response.status).to eq(302)
        #expect(response).to redirect_to(Sip::Clase.last)
				c = Sip::Clase.where(nombre: atc[:nombre]).take
				c.destroy!
      end
    end

    describe "con parámetros invalidos" do
      it "vuelve a plantilla nueva" do
				atc = FactoryGirl.attributes_for(:sip_clase)
				atc[:nombre] = ''
        post :create, {:clase=> atc}
        expect(assigns(:clase)).to be_a_new(Sip::Clase)
        expect(response).to render_template("new")
      end
    end

  end

end
