require_relative '../../test_helper'

module Sip
  class MunicipioTest < ActiveSupport::TestCase

    test "valido" do
      municipio = Municipio.create PRUEBA_MUNICIPIO
      assert municipio.valid?
      municipio.destroy
    end

    test "no valido" do
      municipio = Municipio.new PRUEBA_MUNICIPIO
      municipio.nombre = ''
      assert_not municipio.valid?
      municipio.destroy
    end

    test "existente" do
      municipio = Sip::Municipio.where(id:25).take
      assert_equal municipio.nombre, "BOLIVARIANO LIBERTADOR"
    end

  end
end
