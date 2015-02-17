# encoding: UTF-8
require 'rails_helper'

RSpec.describe "sip/usuarios/show", :type => :view do
  before(:each) do
    @usuario = assign(:usuario, Sip::Usuario.create!(
      :nombre => "Nombre",
    ))
  end

  it "presenta atributos en <p>" do
    render
    expect(rendered).to match(/Nombre/)
  end
end
