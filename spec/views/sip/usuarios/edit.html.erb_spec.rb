# encoding: UTF-8
require 'rails_helper'

RSpec.describe "sip/usuarios/edit", :type => :view do
  before(:each) do
    @usuario = assign(:usuario, Sip::Usuario.create!(
      :nombre => "MyString",
    ))
  end

  it "presenta el formulario para editar usuario" do
    render
    assert_select "form[action=?][method=?]", sip.usuario_path(@usuario), "post" do

      assert_select "input#usuario_nombre[name=?]", "usuario[nombre]"

      #assert_select "select#usuario_regionsjr_id[name=?]", "usuario[regionsjr_id]"
    end
  end
end
