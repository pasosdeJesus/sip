require_relative '../../test_helper'

module Sip
  class TsitioTest < ActiveSupport::TestCase

    test "valido" do
      tsitio = Tsitio.create PRUEBA_TSITIO
      assert tsitio.valid?
      tsitio.destroy
    end

    test "no valido" do
      tsitio = Tsitio.new PRUEBA_TSITIO
      tsitio.nombre = ''
      assert_not tsitio.valid?
      tsitio.destroy
    end

    test "existente" do
      tsitio = Sip::Tsitio.where(id: 2).take
      assert_equal tsitio.nombre, "URBANO"
    end

  end
end
