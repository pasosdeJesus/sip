require 'test_helper'

module Sip
  class VeredaTest < ActiveSupport::TestCase

    PRUEBA_VEREDA = {
      id: 1000000,
      nombre: "Vereda",
      municipio_id: 1,
      fechacreacion: "2022-02-14",
      created_at: "2022-02-14"
    }

    test "valido" do
      vereda = Vereda.create(
        PRUEBA_VEREDA)
      assert(vereda.valid?)
      vereda.destroy
    end

    test "no valido" do
      vereda = Vereda.new(
        PRUEBA_VEREDA)
      vereda.nombre = ''
      assert_not(vereda.valid?)
      vereda.destroy
    end

    test "existente" do
      vereda = Vereda.where(id: 1).take
      assert_equal(vereda.nombre, "Nuevo Morichal")
    end

  end
end
