# encoding: UTF-8

require 'test_helper'


module Sip
  class PerfilactorsocialTest < ActiveSupport::TestCase

    PRUEBA_PERFILACTORSOCIAL= {
      id: 1000  ,
      nombre: "PERFILACTORSOCIAL1",
      fechacreacion: "2018-07-24",
    }

    test "nuevo valido" do
      perfilactorsocial = Perfilactorsocial.create PRUEBA_PERFILACTORSOCIAL
      assert perfilactorsocial.valid?
      perfilactorsocial.destroy
    end

    test "nuevo no valido" do
      perfilactorsocial = Perfilactorsocial.new PRUEBA_PERFILACTORSOCIAL
      perfilactorsocial.nombre = ''
      assert_not perfilactorsocial.valid?
      perfilactorsocial.destroy
    end

  end
end
