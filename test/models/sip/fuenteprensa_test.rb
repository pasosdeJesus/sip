# encoding: UTF-8

require_relative '../../test_helper'

module Sip
  class FuenteprensaTest < ActiveSupport::TestCase

    PRUEBA_FUENTEPRENSA= {
      id: 1000 ,
      nombre: "Fuenteprensa",
      fechacreacion: "2015-05-11",
      created_at: "2015-05-11"
    }

    test "valido" do
      fuenteprensa = Fuenteprensa.create PRUEBA_FUENTEPRENSA
      assert fuenteprensa.valid?
      fuenteprensa.destroy
    end

    test "no valido" do
      fuenteprensa = 
        Fuenteprensa.new PRUEBA_FUENTEPRENSA
      fuenteprensa.nombre = ''
      assert_not fuenteprensa.valid?
      fuenteprensa.destroy
    end

    test "existente" do
      fuenteprensa = Sip::Fuenteprensa.where(id: 1).take
      assert_equal fuenteprensa.nombre, "EL TIEMPO"
    end

  end
end
