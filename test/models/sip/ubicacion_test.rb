require_relative '../../test_helper'

module Sip
  class UbicacionTest < ActiveSupport::TestCase

    PRUEBA_UBICACION= {
      id_tsitio: 1,
      id_pais: 862, # VENEZUELA
      id_departamento: 1, # DISTRITO CAPITAL
      id_municipio: 25, # BOLIVARIANO LIBERTADOR
      id_clase: 217, # CARACAS
      created_at: "2014-11-06",
    }

    test "simple" do
      pais = Pais.find(862)
      ubicacion = Ubicacion.create PRUEBA_UBICACION
      ubicacion.pais = pais
      assert ubicacion.valid?
    end

    test "no valido" do
      ubicacion = Ubicacion.create PRUEBA_UBICACION
      ubicacion.id_tsitio = nil
      assert_not ubicacion.valid?
    end

		test "no valido 2" do
      ubicacion = Ubicacion.create PRUEBA_UBICACION
      ubicacion.id_pais= nil
      assert_not ubicacion.valid?
    end

    test "presenta_nombre" do 
      u = Ubicacion.create PRUEBA_UBICACION
      assert_equal 'VENEZUELA / DISTRITO CAPITAL / BOLIVARIANO LIBERTADOR / CARACAS', 
        u.presenta_nombre
      assert_equal 'VENEZUELA / DISTRITO CAPITAL / BOLIVARIANO LIBERTADOR', 
        u.presenta_nombre({sin_clase: 1})
      assert_equal 'VENEZUELA / DISTRITO CAPITAL', 
        u.presenta_nombre({sin_clase: 1, sin_municipio: 1})
      assert_equal 'VENEZUELA', 
        u.presenta_nombre({sin_clase: 1, sin_municipio: 1, sin_departamento: 1})
      assert_equal '', 
        u.presenta_nombre({sin_clase: 1, sin_municipio: 1, 
                           sin_departamento: 1, sin_pais: 1})
    end

  end
end


