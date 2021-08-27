require_relative '../../test_helper'

module Sip
  class GrupoperTest < ActiveSupport::TestCase

    PRUEBA_GRUPOPER = {
      nombre: "Nombre grupo",
      anotaciones: "x",
    }

    test "valido" do
      grupoper = Sip::Grupoper.create PRUEBA_GRUPOPER
      assert grupoper.valid?
      grupoper.destroy
    end

    test "no valido por falta de nombre" do
      grupoper = Sip::Grupoper.new PRUEBA_GRUPOPER
      grupoper.nombre = nil
      assert_not grupoper.valid?
      grupoper.destroy
    end

    test "no valido por falta de nombre 2" do
      grupoper = Sip::Grupoper.new PRUEBA_GRUPOPER
      grupoper.nombre = ''
      assert_not grupoper.valid?
      grupoper.destroy
    end

    test "no valido por nombre largo" do
      grupoper = Sip::Grupoper.new PRUEBA_GRUPOPER
      grupoper.nombre = 'x'*600
      assert_not grupoper.valid?
      grupoper.destroy
    end

    test "no valido por anotacion larga" do
      grupoper = Sip::Grupoper.new PRUEBA_GRUPOPER
      grupoper.anotaciones = 'x'*2000
      assert_not grupoper.valid?
      grupoper.destroy
    end


    test "valido sin anotación" do
      grupoper = Sip::Grupoper.create PRUEBA_GRUPOPER
      grupoper.anotaciones = nil
      assert grupoper.valid?
      grupoper.destroy
    end


  end
end
