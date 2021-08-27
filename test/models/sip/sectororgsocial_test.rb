require_relative '../../test_helper'

module Sip
  class SectororgsocialTest < ActiveSupport::TestCase

    PRUEBA_SECTORORGSOCIAL = {
      nombre: "Nombre sector",
      observaciones: "x",
      fechacreacion: '2018-07-20'
    }

    test "valido" do
      sectororgsocial = Sip::Sectororgsocial.create PRUEBA_SECTORORGSOCIAL
      assert sectororgsocial.valid?
      sectororgsocial.save!
      sectororgsocial.destroy
    end

    test "no valido por falta de nombre" do
      sectororgsocial = Sip::Sectororgsocial.new PRUEBA_SECTORORGSOCIAL
      sectororgsocial.nombre = ''
      assert_not sectororgsocial.valid?
      sectororgsocial.destroy
    end

    test "no valido por nombre largo" do
      sectororgsocial = Sip::Sectororgsocial.new PRUEBA_SECTORORGSOCIAL
      sectororgsocial.nombre = 'x'*600
      assert_not sectororgsocial.valid?
      sectororgsocial.destroy
    end

    test "no valido por observacion larga" do
      sectororgsocial = Sip::Sectororgsocial.new PRUEBA_SECTORORGSOCIAL
      sectororgsocial.observaciones = 'x'*6000
      assert_not sectororgsocial.valid?
      sectororgsocial.destroy
    end


    test "valido sin observacion" do
      sectororgsocial = Sip::Sectororgsocial.create PRUEBA_SECTORORGSOCIAL
      sectororgsocial.observaciones = nil
      assert sectororgsocial.valid?
      sectororgsocial.destroy
    end

  end
end
