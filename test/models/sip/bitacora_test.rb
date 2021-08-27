require_relative '../../test_helper'

module Sip
  class BitacoraTest < ActiveSupport::TestCase

    PRUEBA_BITACORA = {
      fecha: '2020-03-19',
      ip: "192.168.1.1",
      usuario_id: nil,
      url: 'http://example.com/',
      params: '',
      modelo: 'Sip::Persona',
      modelo_id: 1,
      operacion: 'actualiza',
      detalle: 'detalle'
    }

    test "valido" do
      bitacora = Sip::Bitacora.create PRUEBA_BITACORA
      assert bitacora.valid?
      bitacora.destroy
    end

    test "no valido por falta de fecha" do
      bitacora = Sip::Bitacora.new PRUEBA_BITACORA
      bitacora.fecha = nil
      assert_not bitacora.valid?
      bitacora.destroy
    end

    test "no valido por falta de fecha 2" do
      bitacora = Sip::Bitacora.new PRUEBA_BITACORA
      bitacora.fecha = ''
      assert_not bitacora.valid?
      bitacora.destroy
    end

    test "no valido por ip larga" do
      bitacora = Sip::Bitacora.new PRUEBA_BITACORA
      bitacora.ip = 'x'*600
      assert_not bitacora.valid?
      bitacora.destroy
    end

    test "no valido por modelo largo" do
      bitacora = Sip::Bitacora.new PRUEBA_BITACORA
      bitacora.modelo = 'x'*6000
      assert_not bitacora.valid?
      bitacora.destroy
    end

    test "valido sin detalle" do
      bitacora = Sip::Bitacora.create PRUEBA_BITACORA
      bitacora.detalle = nil
      assert bitacora.valid?
      bitacora.destroy
    end


  end
end
