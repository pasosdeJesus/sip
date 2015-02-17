# encoding: UTF-8
require 'rails_helper'

RSpec.describe "sip/usuarios/new", :type => :view do
  before(:each) do
    assign(:usuario, Sip::Usuario.new(
      :nombre => "MyString",
    ))
  end

  it "presenta el formulario de una nueva usuario" do
    render

    assert_select "form[action=?][method=?]", sip.usuarios_path, "post" do

      assert_select "input#usuario_nombre[name=?]", "usuario[nombre]"
    end
  end
end
