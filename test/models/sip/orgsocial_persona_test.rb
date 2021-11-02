require_relative '../../test_helper'

module Sip
  class OrgsocialPersonaTest < ActiveSupport::TestCase

    test "valido" do
      grupoper = Sip::Grupoper.create PRUEBA_GRUPOPER
      assert grupoper.valid?
      grupoper.save!
      orgsocial = Sip::Orgsocial.new PRUEBA_ORGSOCIAL
      orgsocial.grupoper = grupoper
      assert orgsocial.valid?
      orgsocial.save!

      persona = Sip::Persona.create PRUEBA_PERSONA
      assert persona.valid?
      persona.save!
 
      perfilorgsocial = Sip::Perfilorgsocial.create PRUEBA_PERFILORGSOCIAL
      assert perfilorgsocial.valid?
      perfilorgsocial.save!

      orgsocial_persona= Sip::OrgsocialPersona.new
      orgsocial_persona.orgsocial = orgsocial
      orgsocial_persona.persona = persona
      orgsocial_persona.perfilorgsocial = perfilorgsocial
      assert orgsocial_persona.valid?
      orgsocial_persona.save!
     
      orgsocial_persona.destroy
      perfilorgsocial.destroy
      persona.destroy
      orgsocial.destroy
      grupoper.destroy
    end

    test "no valido" do
      orgsocial_persona= Sip::OrgsocialPersona.new 
      assert_not orgsocial_persona.valid?
      orgsocial_persona.destroy
    end


  end
end
