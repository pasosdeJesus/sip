require_relative '../../test_helper'

module Sip
  class UbicacionpreTest < ActiveSupport::TestCase

    test "crea simple" do
      assert_equal 1, Sip::Pais.where(id: 100).count
      pais = Sip::Pais.find(100)
      ubicacionpre = Ubicacionpre.create PRUEBA_UBICACIONPRE
      assert ubicacionpre.valid?
      assert_equal ubicacionpre.pais_id, pais.id
    end

    test "no valido" do
      assert_raises Exception do
        Ubicacionpre.create PRUEBA_UBICACIONPRE.merge(pais_id: 0)
      end 
    end

    #test "existe" do
    #  ubicacionpre = Ubicacionpre.where(
    #    pais_id: 170, departamento_id: nil, municipio_id: nil, clase_id: nil)
    #  assert_equal 1, ubicacionpre.count
    #end


  end
end
