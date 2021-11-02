require 'test_helper'


module Sip
  class PerfilorgsocialTest < ActiveSupport::TestCase

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
