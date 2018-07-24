# encoding: UTF-8

require_relative '../../test_helper'

module Sip
  class PersonaTest < ActiveSupport::TestCase

    PRUEBA_PERSONA= {
      nombres: "Nombres",
      apellidos: "Apellidos",
      anionac: 1974,
      mesnac: 1,
      dianac: 1,
      sexo: "F",
      numerodocumento: "10000000",
    }

    PRUEBA_TDOCUMENTO= {
      id: 1000 ,
      nombre: "Tdocumento",
      formatoregex: "[0-9]*",
      fechacreacion: "2014-09-22",
      created_at: "2014-09-22"
    }

    test "valido" do
      persona = Persona.create PRUEBA_PERSONA
      assert persona.valid?
      persona.destroy
    end

    test "no valido" do
      persona = Persona.new PRUEBA_PERSONA
      persona.nombres = ''
      assert_not persona.valid?
      persona.destroy
    end

    test "no valido por documento errado" do
      tdocumento = Sip::Tdocumento.create PRUEBA_TDOCUMENTO
      assert tdocumento.valid?
      tdocumento.save!
      persona = Persona.new PRUEBA_PERSONA
      persona.tdocumento_id = tdocumento.id
      persona.numerodocumento = 'a'
      assert_not persona.valid?
      persona.destroy
      tdocumento.destroy
    end

    test "no valido por año errado" do
      persona = Persona.new PRUEBA_PERSONA
      persona.anionac = 1
      assert_not persona.valid?
      persona.destroy
    end

    test "no valido por mes errado" do
      persona = Persona.new PRUEBA_PERSONA
      persona.mesnac = 0
      assert_not persona.valid?
      persona.destroy
    end

    test "no valido por mes errado 2" do
      persona = Persona.new PRUEBA_PERSONA
      persona.mesnac = 13
      assert_not persona.valid?
      persona.destroy
    end

    test "no valido por dia errado" do
      persona = Persona.new PRUEBA_PERSONA
      persona.dianac = 0
      assert_not persona.valid?
      persona.destroy
    end

    test "no valido por dia errado 2" do
      persona = Persona.new PRUEBA_PERSONA
      persona.dianac = 32
      assert_not persona.valid?
      persona.destroy
    end

    test "no valido por dia errado 3" do
      persona = Persona.new PRUEBA_PERSONA
      persona.mesnac = 4
      persona.dianac = 31
      assert_not persona.valid?
      persona.destroy
    end

    test "no valido por dia errado 4" do
      persona = Persona.new PRUEBA_PERSONA
      persona.mesnac = 2
      persona.dianac = 30
      assert_not persona.valid?
      persona.destroy
    end

    test "valido con documento no numérico" do
      persona = Persona.new PRUEBA_PERSONA
      persona.tdocumento_id = 6
      persona.numerodocumento = 'T-100'
      assert persona.valid?
      persona.destroy
    end

    test "valido sin documento" do
      persona = Persona.new PRUEBA_PERSONA
      persona.tdocumento_id = nil
      persona.numerodocumento = nil
      assert persona.valid?
      persona.destroy
    end

  end
end
