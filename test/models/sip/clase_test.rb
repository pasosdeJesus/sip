require_relative '../../test_helper'

module Sip
  class ClaseTest < ActiveSupport::TestCase

    test "valido" do
      clase = Clase.create PRUEBA_CLASE
      assert clase.valid?
      clase.destroy!
    end

    test "no valido" do
      clase = Clase.new PRUEBA_CLASE
      clase.nombre = ''
      assert_not clase.valid?
      clase.destroy
    end

    test "existente" do
      clase = Sip::Clase.where(id: 217).take
      assert_equal clase.nombre, "Caracas"
    end

  end
end
