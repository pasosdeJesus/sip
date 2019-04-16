# encoding: UTF-8

require_relative '../../test_helper'

module Sip
  class FuenteprensaTest < ActiveSupport::TestCase

    PRUEBA_FUENTEPRENSA= {
      id: 1000 ,
      nombre: "Fuentesprensanueva",
      fechacreacion: "2001-01-01",
      created_at: "2001-01-01"
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
