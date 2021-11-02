require_relative '../../test_helper'

module Sip
  class FuenteprensaTest < ActiveSupport::TestCase

    test "valido" do
      fuenteprensa = Fuenteprensa.create PRUEBA_FUENTEPRENSA
      assert fuenteprensa.valid?
      fuenteprensa.destroy
    end

    test "no valido" do
      fuenteprensa = 
        Fuenteprensa.new PRUEBA_FUENTEPRENSA
      fuenteprensa.nombre = ''
      assert_not fuenteprensa.valid?
      fuenteprensa.destroy
    end

    test "existente" do
      fuenteprensa = Sip::Fuenteprensa.where(id: 1).take
      assert_equal fuenteprensa.nombre, "EL TIEMPO"
    end

  end
end
