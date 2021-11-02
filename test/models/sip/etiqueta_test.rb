require_relative '../../test_helper'

module Sip
  class EtiquetaTest < ActiveSupport::TestCase

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
