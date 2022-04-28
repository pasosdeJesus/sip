require 'test_helper'

module Sip
  class TipoorgTest < ActiveSupport::TestCase

    PRUEBA_TIPOORG = {
      nombre: "Tipoorg",
      fechacreacion: "2021-10-10",
      created_at: "2021-10-10"
    }

    test "valido" do
      tipoorg = Sip::Tipoorg.create(
        PRUEBA_TIPOORG)
      assert(tipoorg.valid?)
      tipoorg.destroy
    end

    test "no valido" do
      tipoorg = Sip::Tipoorg.new(
        PRUEBA_TIPOORG)
      tipoorg.nombre = ''
      assert_not(tipoorg.valid?)
      tipoorg.destroy
    end

    test "existente" do
      tipoorg = Sip::Tipoorg.where(id: 1).take
      assert_equal(tipoorg.nombre, "ORGANIZACIÓN DE LA SOCIEDAD CIVIL (ACOMPAÑADA)")
    end

  end
end
