# encoding: UTF-8

require_relative '../../test_helper'

module Sip
  class SectoractorTest < ActiveSupport::TestCase

    PRUEBA_SECTORACTOR = {
      nombre: "Nombre sector social actor",
      observaciones: "xyz",
      fechacreacion: '2019-04-16'
    }

    test "valido" do
      sectoractor = Sip::Sectoractor.create PRUEBA_SECTORACTOR
      assert sectoractor.valid?
      sectoractor.save!
      sectoractor.destroy
    end

    test "no valido por falta de nombre" do
      sectoractor = Sip::Sectoractor.new PRUEBA_SECTORACTOR
      sectoractor.nombre = ''
      assert_not sectoractor.valid?
      sectoractor.destroy
    end

    test "no valido por nombre largo" do
      sectoractor = Sip::Sectoractor.new PRUEBA_SECTORACTOR
      sectoractor.nombre = 'x'*600
      assert_not sectoractor.valid?
      sectoractor.destroy
    end

    test "no valido por observacion larga" do
      sectoractor = Sip::Sectoractor.new PRUEBA_SECTORACTOR
      sectoractor.observaciones = 'x'*6000
      assert_not sectoractor.valid?
      sectoractor.destroy
    end


    test "valido sin observacion" do
      sectoractor = Sip::Sectoractor.create PRUEBA_SECTORACTOR
      sectoractor.observaciones = nil
      assert sectoractor.valid?
      sectoractor.destroy
    end

  end
end
