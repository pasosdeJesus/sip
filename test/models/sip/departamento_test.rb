# encoding: UTF-8

require_relative '../../test_helper'

module Sip
  class DepartamentoTest < ActiveSupport::TestCase

    PRUEBA_DEPARTAMENTO= {
      id: 1000,
      nombre: "DEPARTAMENTO1",
      latitud: 1.5,
      longitud: 1.5,
      fechacreacion: "2014-08-04",
      fechadeshabilitacion: nil,
      id_pais: 862
    }

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
