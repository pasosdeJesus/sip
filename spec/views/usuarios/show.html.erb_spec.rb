# encoding: UTF-8
require 'rails_helper'

RSpec.describe "usuarios/show", :type => :view do
  before(:each) do
    @usuario = assign(:usuario, Usuario.create!(
      nombre: "Nombre2", 
      nusuario: "nombre2", 
			email: 'x2@x2.org',
			fechacreacion: '2014-1-1',
			encrypted_password: 'x',
			rol:  Ability::ROLADMIN
    ))
  end

	after(:each) do
		@usuario.destroy!
	end

  it "presenta atributos en <p>" do
    render
    expect(rendered).to match(/ombre2/)
  end
end
