require_relative '../../test_helper'
require_relative './grupoper_test'

module Sip
  class OrgsocialTest < ActiveSupport::TestCase


    PRUEBA_ORGSOCIAL = {
      telefono: '123',
      fax: '456',
      direccion: 'dir',
      web: 'web'
    }

    test "valido" do
      grupoper = Sip::Grupoper.create Sip::GrupoperTest::PRUEBA_GRUPOPER
      assert grupoper.valid?
      grupoper.save!
      orgsocial = Sip::Orgsocial.new PRUEBA_ORGSOCIAL
      orgsocial.grupoper = grupoper
      assert orgsocial.valid?
      orgsocial.save!
      orgsocial.destroy
      grupoper.destroy
    end

    test "no valido" do
      orgsocial = Sip::Orgsocial.new PRUEBA_ORGSOCIAL
      orgsocial.grupoper = nil
      assert !orgsocial.valid?
      orgsocial.destroy
    end


  end
end
