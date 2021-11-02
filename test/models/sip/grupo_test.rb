require 'test_helper'

module Sip
  class GrupoTest < ActiveSupport::TestCase

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
