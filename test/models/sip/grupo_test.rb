# encoding: UTF-8

require 'test_helper'

module Sip
  class GrupoTest < ActiveSupport::TestCase

    PRUEBA_GRUPO= {
      id: 1000  ,
      nombre: "GRUPO1",
      fechacreacion: "2017-04-13",
    }

    test "nuevo valido" do
      grupo = Grupo.create PRUEBA_GRUPO
      assert grupo.valid?
      grupo.destroy
    end

    test "nuevo no valido" do
      grupo = Grupo.new PRUEBA_GRUPO
      grupo.nombre = ''
      assert_not grupo.valid?
      grupo.destroy
    end

  end
end
