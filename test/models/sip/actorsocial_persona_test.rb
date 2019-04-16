# encoding: UTF-8

require_relative '../../test_helper'
require_relative './grupoper_test'
require_relative './actorsocial_test'
require_relative './persona_test'
require_relative './perfilactorsocial_test'
require_relative './ubicacion_test'

module Sip
  class ActorsocialPersonaTest < ActiveSupport::TestCase

    test "valido" do
      grupoper = Sip::Grupoper.create Sip::GrupoperTest::PRUEBA_GRUPOPER
      assert grupoper.valid?
      grupoper.save!
      actorsocial = Sip::Actorsocial.new Sip::ActorsocialTest::PRUEBA_ACTORSOCIAL
      actorsocial.grupoper = grupoper
      assert actorsocial.valid?
      actorsocial.save!

      persona = Sip::Persona.create Sip::PersonaTest::PRUEBA_PERSONA
      assert persona.valid?
      persona.save!
 
      perfilactorsocial = Sip::Perfilactorsocial.create Sip::PerfilactorsocialTest::PRUEBA_PERFILACTORSOCIAL
      assert perfilactorsocial.valid?
      perfilactorsocial.save!

      ubicacion = Sip::UbicacionTest::PRUEBA_UBICACION
      assert ubicacion.valid?
      ubicacion.saved!

      actorsocial_persona= Sip::ActorsocialPersona.new
      actorsocial_persona.actorsocial = actorsocial
      actorsocial_persona.persona = persona
      actorsocial_persona.perfilactorsocial = perfilactorsocial
      assert actorsocial_persona.valid?
      actorsocial_persona.save!
     
      actorsocial_persona.destroy
      perfilactorsocial.destroy
      persona.destroy
      actorsocial.destroy
      grupoper.destroy
      ubicacion.destroy
    end

    test "no valido" do
      actorsocial_persona= Sip::ActorsocialPersona.new 
      assert_not actorsocial_persona.valid?
      actorsocial_persona.destroy
    end


  end
end
