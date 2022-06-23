require_relative '../../test_helper'

module Sip
  class EstadosolTest < ActiveSupport::TestCase

    test "valido" do
      estadosol = Sip::Estadosol.create PRUEBA_ESTADOSOL
      assert estadosol.valid?
      estadosol.destroy
    end

    test "no valido por falta de nombre" do
      estadosol = Sip::Estadosol.new PRUEBA_ESTADOSOL
      estadosol.nombre = ''
      assert_not estadosol.valid?
      estadosol.destroy
    end

    test "valido sin observaciones" do
      estadosol = Sip::Estadosol.create PRUEBA_ESTADOSOL
      estadosol.observaciones = nil
      assert estadosol.valid?
      estadosol.destroy
    end

    test "existente" do
      estadosol = Sip::Estadosol.find(1)
      assert estadosol.valid?
      assert_equal estadosol.nombre, 'PENDIENTE'
      estadosol.destroy
    end


  end
end
