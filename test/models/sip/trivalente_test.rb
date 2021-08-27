require 'test_helper'

module Sip
  class TrivalenteTest < ActiveSupport::TestCase

    PRUEBA_TRIVALENTE = {
      nombre: "Trivalente",
      fechacreacion: "2019-08-17",
      created_at: "2019-08-17"
    }

    test "valido" do
      trivalente = Trivalente.create(
        PRUEBA_TRIVALENTE)
      assert(trivalente.valid?)
      trivalente.destroy
    end

    test "no valido" do
      trivalente = Trivalente.new(
        PRUEBA_TRIVALENTE)
      trivalente.nombre = ''
      assert_not(trivalente.valid?)
      trivalente.destroy
    end

    test "existente" do
      trivalente = Trivalente.where(id: 1).take
      assert_equal(trivalente.nombre, "SIN RESPUESTA")
    end

  end
end
