# encoding: UTF-8
require 'rails_helper'

module Sip
  RSpec.describe Fuenteprensa, :type => :model do

    it "valido" do
      fuenteprensa = FactoryGirl.build(:sip_fuenteprensa)
      expect(fuenteprensa).to be_valid
      fuenteprensa.destroy
    end

    it "no valido" do
      fuenteprensa = 
        FactoryGirl.build(:sip_fuenteprensa, nombre: '')
      expect(fuenteprensa).not_to be_valid
      fuenteprensa.destroy
    end

    it "existente" do
      fuenteprensa = Sip::Fuenteprensa.where(id: 1).take
      expect(fuenteprensa.nombre).to eq("EL TIEMPO")
    end

  end
end
