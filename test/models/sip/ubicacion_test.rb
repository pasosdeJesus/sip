# encoding: UTF-8

require_relative '../../test_helper'

module Sip
  class UbicacionTest < ActiveSupport::TestCase

    PRUEBA_UBICACION= {
      id_tsitio: 1,
      id_pais: 862,
      created_at: "2014-11-06",
    }

    test "simple" do
      pais = Pais.find(862)
      ubicacion = Ubicacion.create PRUEBA_UBICACION
      ubicacion.pais = pais
      assert ubicacion.valid?
    end

    test "no valido" do
      ubicacion = Ubicacion.create PRUEBA_UBICACION
      ubicacion.id_tsitio = nil
      assert_not ubicacion.valid?
    end

		test "no valido 2" do
      ubicacion = Ubicacion.create PRUEBA_UBICACION
      ubicacion.id_pais= nil
      assert_not ubicacion.valid?
    end


  end
end
