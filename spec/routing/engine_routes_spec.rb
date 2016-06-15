require "rails_helper"

RSpec.describe UsuariosController, :type => :routing do
  routes { Sip::Engine.routes }

  it "ruta a listado de usuarios" do
    skip
    expect(:get => main_app.usuarios_path).
      to route_to(:controller => "sip/usuarios", :action => "index")
  end
end
