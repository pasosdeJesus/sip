# encoding: UTF-8
require 'rails_helper'

module Sip
  RSpec.describe PersonaTrelacion, :type => :model do

    it "valido" do
      persona1 = Sip::Persona.create(
        nombres: 'nombre1', apellidos: 'apellidos1', sexo: 'S'
      )
      expect(persona1).to be_valid
      persona2 = Sip::Persona.create(nombres: 'nombre2', apellidos: 'apellidos2', sexo: 'S')
      expect(persona2).to be_valid
      trelacion = Sip::Trelacion.where(id: 'AB').take
      expect(trelacion).to be_valid
      pt = Sip::PersonaTrelacion.create(
        personauno: persona1, 
        personados: persona2, 
        trelacion: trelacion
      )
      expect(pt).to be_valid
      pt.destroy!
      persona1.destroy!
      persona2.destroy!
    end

    it "invalido: falta persona 1" do
      persona2 = Sip::Persona.create(
        nombres: 'nombrei12', apellidos: 'apellidosi12', sexo: 'S'
      )
      expect(persona2).to be_valid
      trelacion = Sip::Trelacion.where(id: 'AB').take
      expect(trelacion).to be_valid
      pt = Sip::PersonaTrelacion.create(
        personados: persona2, 
        trelacion: trelacion
      )
      expect(pt).not_to be_valid
      persona2.destroy!
    end

    it "invalido: falta persona 2" do
      persona1 = Sip::Persona.create(
        nombres: 'nombrei21', apellidos: 'apellidos1', sexo: 'S'
      )
      expect(persona1).to be_valid
      trelacion = Sip::Trelacion.where(id: 'AB').take
      expect(trelacion).to be_valid
      pt = Sip::PersonaTrelacion.create(
        personauno: persona1, 
        trelacion: trelacion
      )
      expect(pt).not_to be_valid
      persona1.destroy!
    end

    it "invalido: falta trelacion" do
      persona1 = Sip::Persona.create(
        nombres: 'nombrei31', apellidos: 'apellidos1', sexo: 'S'
      )
      expect(persona1).to be_valid
      persona2 = Sip::Persona.create(
        nombres: 'nombrei32', apellidos: 'apellidos2', sexo: 'S'
      )
      expect(persona2).to be_valid
      pt = Sip::PersonaTrelacion.create(
        personauno: persona1,
        personados: persona2,
        id_trelacion: nil
      )
      expect(pt).not_to be_valid
      pt.destroy!
      persona1.destroy!
      persona2.destroy!
    end

    it "invalido: no única" do
      persona1 = Sip::Persona.create(
        nombres: 'nombrei41', apellidos: 'apellidos1', sexo: 'S'
      )
      expect(persona1).to be_valid
      persona2 = Sip::Persona.create(
        nombres: 'nombre2', apellidos: 'apellidos2', sexo: 'S'
      )
      expect(persona2).to be_valid
      trelacion = Sip::Trelacion.where(id: 'AB').take
      expect(trelacion).to be_valid

      pt = Sip::PersonaTrelacion.create(
        personauno: persona1,
        personados: persona2,
        trelacion: trelacion
      )
      expect(pt).to be_valid
      pt2 = Sip::PersonaTrelacion.create(
        personauno: persona1,
        personados: persona2,
        trelacion: trelacion
      )
      expect(pt2).not_to be_valid
      pt.destroy!
      persona1.destroy!
      persona2.destroy!
    end




  end
end
