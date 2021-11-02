require_relative '../../test_helper'

module Sip
  class DepartamentoTest < ActiveSupport::TestCase

    test "valido" do
      departamento = Departamento.create PRUEBA_DEPARTAMENTO
      assert departamento.valid?
      departamento.destroy
    end

    test "no valido" do
      departamento = Departamento.new PRUEBA_DEPARTAMENTO
      departamento.nombre = ''
      assert_not departamento.valid?
      departamento.destroy
    end

    test "existente" do
      departamento = Sip::Departamento.where(id_pais: 862, id:1).take
      assert_equal departamento.nombre, "DISTRITO CAPITAL"
    end
  end
end
