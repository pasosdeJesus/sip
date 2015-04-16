# encoding: UTF-8
require 'rails_helper'

module Sip
  RSpec.describe Oficina, :type => :model do
    it "valido" do
      oficina = FactoryGirl.build(:sip_oficina)
      expect(oficina).to be_valid
      oficina.destroy
    end

    it "no valido" do
      oficina = FactoryGirl.build(:sip_oficina, nombre: '')
      expect(oficina).not_to be_valid
      oficina.destroy
    end

    it "existente" do
      oficina = Sip::Oficina.find(1)
      expect(oficina.nombre).to eq("SIN INFORMACIÓN")
    end
  end
end
