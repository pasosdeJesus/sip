# encoding: UTF-8

require_relative '../../test_helper'
require_relative './grupoper_test'

module Sip
  class ActorsocialTest < ActiveSupport::TestCase


    PRUEBA_ACTORSOCIAL = {
      telefono: '123',
      fax: '456',
      direccion: 'dir',
      web: 'web'
    }

    test "valido" do
      grupoper = Sip::Grupoper.create Sip::GrupoperTest::PRUEBA_GRUPOPER
      assert grupoper.valid?
      grupoper.save!
      actorsocial = Sip::Actorsocial.new PRUEBA_ACTORSOCIAL
      actorsocial.grupoper = grupoper
      assert actorsocial.valid?
      actorsocial.save!
      actorsocial.destroy
      grupoper.destroy
    end

    test "no valido" do
      actorsocial = Sip::Actorsocial.new PRUEBA_ACTORSOCIAL
      actorsocial.grupoper = nil
      assert actorsocial.valid?
      actorsocial.destroy
    end


  end
end
