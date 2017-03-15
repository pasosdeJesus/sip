# encoding: UTF-8
require_relative '../../test_helper'

module Sip
  class MunicipioTest < ActiveSupport::TestCase

    PRUEBA_MUNICIPIO= {
      id: 100000,
      nombre: "MUNICIPIO1",
      latitud: 1.5,
      longitud: 1.5,
      fechacreacion: "2014-08-04",
      fechadeshabilitacion: "2014-08-04",
      id_departamento: 1 ,
    }

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
