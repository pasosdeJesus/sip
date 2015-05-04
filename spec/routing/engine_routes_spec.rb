require "rails_helper"

RSpec.describe UsuariosController, :type => :routing do
  routes { Sip::Engine.routes }

  it "ruta a listado de usuarios" do
    expect(:get => usuarios_path).
      to route_to(:controller => "sip/usuarios", :action => "index")
  end
end
