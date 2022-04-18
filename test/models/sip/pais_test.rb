require_relative '../../test_helper'

module Sip
  # Como nuestras pruebas a modelos se hacen en una base de datos
  # que tiene muchos datos básicos (e.g información geográfica), 
  # no usamo database_clenaer, sino que las pruebas que crean elementos 
  # de datos básicos
  # son responsables de borrarlos
  class PaisTest < ActiveSupport::TestCase

    test "nuevo valido" do
      pais = Pais.create PRUEBA_PAIS
      assert pais.valid?
      pais.destroy
    end

    test "nuevo no valido" do
      pais = Pais.new PRUEBA_PAIS
      pais.nombre = ''
      assert_not pais.valid?
      pais.nombre= 'x'
      assert pais.valid?
      pais.fechacreacion='1999-01-01'
      assert_not pais.valid?
      pais.fechacreacion='2004-01-01'
      assert pais.valid?
      pais.fechadeshabilitacion='2000-01-01'
      assert_not pais.valid?
      pais.fechadeshabilitacion='2005-01-01'
      assert pais.valid?

      pais.destroy
    end

    test "existente" do
      pais = Sip::Pais.find(862) # Venezuela
      assert_equal pais.nombre, "Venezuela"
    end

    test "otras de basica" do
      pais = Sip::Pais.find(862) # Venezuela
      assert_equal 862, pais.busca_valor
      assert Sip::Pais.filtro_habilitado('si').count > 0
      assert Sip::Pais.filtro_habilitado('no').count == 0
      assert Sip::Pais.filtro_nombre('COLOMBIA').count == 1
      assert Sip::Pais.filtro_nombre('LOCOMBIA').count == 0
      assert Sip::Pais.filtro_observaciones('VIDIPOLA').count == 0
      assert Sip::Pais.filtro_fechacreacionini('2000-01-01').count > 0
      assert Sip::Pais.filtro_fechacreacionini('2030-01-01').count == 0
      assert Sip::Pais.filtro_fechacreacionfin('2000-01-01').count == 0
      assert Sip::Pais.filtro_fechacreacionfin('2030-01-01').count > 0

    end
  end
end
