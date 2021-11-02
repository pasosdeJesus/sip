require_relative '../../test_helper'

module Sip
  class OficinaTest < ActiveSupport::TestCase

    
    test "valido" do
      oficina = Oficina.create PRUEBA_OFICINA
      assert oficina.valid?
      oficina.destroy
    end

    test "no valido" do
      oficina = Oficina.new PRUEBA_OFICINA
      oficina.nombre = ''
      assert_not oficina.valid?
      oficina.destroy
    end

    test "No valido por cantidad de caracteres en observaciones" do 
      oficina= Oficina.new PRUEBA_OFICINA
      oficina.observaciones= 'X'*5001
      assert_not oficina.valid?
      oficina .destroy
    end

    test "existente" do
      oficina = Sip::Oficina.find(1)
      assert_equal oficina.nombre, "SIN INFORMACIÓN"
    end
  end
end
