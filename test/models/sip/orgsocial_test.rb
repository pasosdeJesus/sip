require_relative '../../test_helper'

module Sip
  class OrgsocialTest < ActiveSupport::TestCase

    test "valido" do
      grupoper = Sip::Grupoper.create PRUEBA_GRUPOPER
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
