# encoding: UTF-8

require 'test_helper'


module Sip
  class PerfilorgsocialTest < ActiveSupport::TestCase

    PRUEBA_PERFILORGSOCIAL= {
      id: 1000  ,
      nombre: "PERFILORGSOCIAL1",
      fechacreacion: "2018-07-24",
    }

    test "nuevo valido" do
      perfilorgsocial = Perfilorgsocial.create PRUEBA_PERFILORGSOCIAL
      assert perfilorgsocial.valid?
      perfilorgsocial.destroy
    end

    test "nuevo no valido" do
      perfilorgsocial = Perfilorgsocial.new PRUEBA_PERFILORGSOCIAL
      perfilorgsocial.nombre = ''
      assert_not perfilorgsocial.valid?
      perfilorgsocial.destroy
    end

  end
end
