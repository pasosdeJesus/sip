require_relative '../../test_helper'

module Sip
  class EtiquetaTest < ActiveSupport::TestCase

    PRUEBA_ETIQUETA= {
      id: 1000,
      nombre: "Eti",
      observaciones: "O",
      fechacreacion: "2014-09-04",
      created_at: "2014-09-04"
    }

    test "valido" do
      etiqueta = Etiqueta.create PRUEBA_ETIQUETA
      assert etiqueta.valid?
      etiqueta.destroy
    end

    test "no valido" do
      etiqueta = Etiqueta.new PRUEBA_ETIQUETA
      etiqueta.nombre = ''
      assert_not etiqueta.valid?
      etiqueta.destroy
    end

    test "existente" do
      etiqueta = Sip::Etiqueta.find(3)
      assert_equal etiqueta.nombre, "IMPORTA_RELATO"
    end
  end
end
