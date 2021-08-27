require_relative '../../test_helper'

module Sip
  # Como nuestras pruebas a modelos se hacen en una base de datos
  # que tiene muchos datos básicos (e.g información geográfica), 
  # no usamo database_clenaer, sino que las pruebas que crean elementos 
  # de datos básicos
  # son responsables de borrarlos
  class PaisTest < ActiveSupport::TestCase

    PRUEBA_PAIS= {
      id: 1000  ,
      nombre: "PASI1",
      nombreiso: "PAIS1",
      fechacreacion: "2014-08-04",
    }

    test "nuevo valido" do
      pais = Pais.create PRUEBA_PAIS
      assert pais.valid?
      pais.destroy
    end

    test "nuevo no valido" do
      pais = Pais.new PRUEBA_PAIS
      pais.nombre = ''
      assert_not pais.valid?
      pais.destroy
    end

    test "existente" do
      pais = Sip::Pais.find(862) # Venezuela
      assert_equal pais.nombre, "VENEZUELA"
    end
  end
end
