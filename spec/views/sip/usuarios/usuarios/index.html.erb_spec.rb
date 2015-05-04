# encoding: UTF-8
require 'rails_helper'

RSpec.describe "sip/usuarios/index", :type => :view do
  before(:each) do
    assign(:usuarios, [
      Sip::Usuario.create!(
        :nombre => "Nombre",
      ),
      Sip::Usuario.create!(
        :nombre => "Nombre",
      )
    ])
  end

#  it "presenta lista de usuarios" do
#    render
#    assert_select "tr>td", :text => 1.to_s, :count => 2
#    assert_select "tr>td", :text => "Nombre".to_s, :count => 2
#    assert_select "tr>td", :text => "Objetivo".to_s, :count => 2
#    assert_select "tr>td", :text => "Proyecto".to_s, :count => 2
#    assert_select "tr>td", :text => "Resultado".to_s, :count => 2
#    assert_select "tr>td", :text => "Observaciones".to_s, :count => 2
#    assert_select "tr>td", :text => "2014-11-20".to_s, :count => 2
#    assert_select "tr>td", :text => 2.to_s, :count => 2
#  end
  #  Probar json
end
