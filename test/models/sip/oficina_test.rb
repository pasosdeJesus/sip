# encoding: UTF-8
require_relative '../../test_helper'

module Sip
  class OficinaTest < ActiveSupport::TestCase

    PRUEBA_OFICINA= {
      id: 1000 ,
      nombre: "Ofi",
      observaciones: 'Ofi',
      fechacreacion: "2015-04-16",
      created_at: "2015-04-16",
    }
    
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
      oficina.observaciones= 'X'*600
      assert_not oficina.valid?
      oficina .destroy
    end

    test "existente" do
      oficina = Sip::Oficina.find(1)
      assert_equal oficina.nombre, "SIN INFORMACIÓN"
    end
  end
end
