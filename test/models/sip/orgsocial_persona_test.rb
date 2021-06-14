# encoding: UTF-8

require_relative '../../test_helper'
require_relative './grupoper_test'
require_relative './orgsocial_test'
require_relative './persona_test'
require_relative './perfilorgsocial_test'

module Sip
  class OrgsocialPersonaTest < ActiveSupport::TestCase

    test "valido" do
      grupoper = Sip::Grupoper.create Sip::GrupoperTest::PRUEBA_GRUPOPER
      assert grupoper.valid?
      grupoper.save!
      orgsocial = Sip::Orgsocial.new Sip::OrgsocialTest::PRUEBA_ORGSOCIAL
      orgsocial.grupoper = grupoper
      assert orgsocial.valid?
      orgsocial.save!

      persona = Sip::Persona.create Sip::PersonaTest::PRUEBA_PERSONA
      assert persona.valid?
      persona.save!
 
      perfilorgsocial = Sip::Perfilorgsocial.create Sip::PerfilorgsocialTest::PRUEBA_PERFILORGSOCIAL
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
