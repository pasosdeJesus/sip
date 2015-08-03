# encoding: UTF-8
require 'rails_helper'

module Sip
  RSpec.describe Trelacion, :type => :model do

    it "valido" do
      trelacion = FactoryGirl.build(:sip_trelacion)
      expect(trelacion).to be_valid
      trelacion.destroy!
    end

    it "no valido" do
      trelacion = FactoryGirl.build(:sip_trelacion, nombre: '')
      expect(trelacion).not_to be_valid
      trelacion.destroy!
    end

    it "existente" do
      trelacion = Sip::Trelacion.where(id: 'SI').take
      expect(trelacion.nombre).to eq("SIN INFORMACIÓN")
    end

  end
end
