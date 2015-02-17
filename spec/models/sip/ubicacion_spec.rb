# encoding: UTF-8
require 'rails_helper'

module Sip

  RSpec.describe Ubicacion, :type => :model do
    context "valido" do
      let(:pais) { Pais.find(862) }
      let(:ubicacion) { FactoryGirl.build(:sip_ubicacion, pais: pais) }
      after(:each) do
        ubicacion.destroy
      end

      it "simple" do
        expect(ubicacion).to be_valid
      end
    end

    it "no valido 1" do
      ubicacion = FactoryGirl.build(:sip_ubicacion)
      expect(ubicacion).not_to be_valid
      ubicacion.destroy
    end

    it "no valido 2" do
      ubicacion = FactoryGirl.build(:sip_ubicacion, id_tsitio: nil) 
      expect(ubicacion).not_to be_valid
      ubicacion.destroy
    end


  end
end
