require_relative '../../test_helper'

module Sip
  class TrelacionTest < ActiveSupport::TestCase

    PRUEBA_TRELACION= {
      id: 'NN' ,
      nombre: "Trelacion",
      inverso: 'NN',
      fechacreacion: "2014-09-09",
      created_at: "2014-09-09",
    }

    test "valido" do
      trelacion = Trelacion.create PRUEBA_TRELACION
      assert trelacion.valid?
      trelacion.destroy!
    end

    test "no valido" do
      trelacion = Trelacion.new PRUEBA_TRELACION
      trelacion.nombre = ''
      assert_not trelacion.valid?
      trelacion.destroy!
    end

    test "existente" do
      trelacion = Sip::Trelacion.where(id: 'SI').take
      assert_equal trelacion.nombre, "SIN INFORMACIÓN"
    end

  end
end
