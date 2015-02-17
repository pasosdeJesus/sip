# encoding: UTF-8
require 'rails_helper'

module Sip
  RSpec.describe Anexo, :type => :model do
    context "valido" do
      let(:anexo) { 
        FactoryGirl.build(:sip_anexo) 
      }
      after(:each) do
        anexo.destroy
      end

      it "simple" do
        anexo.adjunto = File.new(Rails.root + 'db/seeds.rb')
        expect(anexo).to be_valid
      end
    end

    it "no valido 1" do
      anexo = FactoryGirl.build(:sip_anexo)
      expect(anexo).not_to be_valid
      anexo.destroy
    end

    it "no valido 2" do
      anexo = FactoryGirl.build(:sip_anexo, descripcion: nil) 
      expect(anexo).not_to be_valid
      anexo.destroy
    end
  end
end
