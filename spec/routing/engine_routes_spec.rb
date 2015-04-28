require "rails_helper"

module Sip
    class UsuariosController < ::UsuariosController
    end
end
RSpec.describe UsuariosController, :type => :routing do
    routes { Sip::Engine.routes }

    it "ruta a listado de usuarios" do
        expect(:get => usuarios_path).
        to route_to(:controller => "sip/usuarios", :action => "index")
    end
end
