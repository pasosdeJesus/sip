require_relative '../../test_helper'

module Sip
  class UbicacionpreTest < ActiveSupport::TestCase

    test "crea simple" do
      assert_equal 1, Sip::Pais.where(id: 100).count
      pais = Sip::Pais.find(100)
      ubicacionpre = Ubicacionpre.create PRUEBA_UBICACIONPRE
      assert ubicacionpre.valid?
      assert_equal ubicacionpre.pais_id, pais.id
    end

    test "no valido" do
      assert_raises Exception do
        Ubicacionpre.create PRUEBA_UBICACIONPRE.merge(pais_id: 0)
      end 
    end

    #test "existe" do
    #  ubicacionpre = Ubicacionpre.where(
    #    pais_id: 170, departamento_id: nil, municipio_id: nil, clase_id: nil)
    #  assert_equal 1, ubicacionpre.count
    #end


    test "nombre estandar" do
      
      assert_nil Sip::Ubicacionpre.buscar_o_agregar(
        nil, nil, nil, nil, nil, nil, nil, nil, nil)

      u = Sip::Ubicacionpre.create(
        pais_id: 170, 
        nombre: 'x'
      )
      u.save
      assert u.poner_nombre_estandar
      idu = Sip::Ubicacionpre.buscar_o_agregar(
        170, nil, nil, nil, nil, nil, nil, nil, nil) 
      assert idu > 0
      u = Sip::Ubicacionpre.find(idu)
      assert_equal 'Colombia', u.nombre
      assert_nil u.nombre_sin_pais

      u = Sip::Ubicacionpre.create(
        pais_id: 170, 
        departamento_id: 11,
        nombre: 'x'
      )
      u.save
      assert u.poner_nombre_estandar

      idu = Sip::Ubicacionpre.buscar_o_agregar(
        170, 11, nil, nil, nil, nil, nil, nil, nil) 
      assert idu > 0
      u = Sip::Ubicacionpre.find(idu)
      assert_equal 'Boyacá / Colombia', u.nombre
      assert_equal 'Boyacá', u.nombre_sin_pais

      u = Sip::Ubicacionpre.create(
        pais_id: 170, 
        departamento_id: 11,
        municipio_id: 1013,
        nombre: 'x'
      )
      u.save
      assert u.poner_nombre_estandar

      idu = Sip::Ubicacionpre.buscar_o_agregar(
        170, 11, 1013, nil, nil, nil, nil, nil, nil) 
      assert idu > 0
      u = Sip::Ubicacionpre.find(idu)
      assert_equal 'Ráquira / Boyacá / Colombia', u.nombre
      assert_equal 'Ráquira / Boyacá', u.nombre_sin_pais

      u = Sip::Ubicacionpre.create(
        pais_id: 170, 
        departamento_id: 11,
        municipio_id: 1013,
        clase_id: 1248,
        nombre: 'x'
      )
      # no ponemos tsitio_id porque hasta centros poblados por convención
      # se han puesto en nil (tal vez porque podrían ser urbano o 
      # urbano/rural).
      u.save
      assert u.poner_nombre_estandar

      idc = Sip::Ubicacionpre.buscar_o_agregar(
        170, 11, 1013, 1248, nil, nil, nil, nil, nil) 
      assert idc > 0
      u = Sip::Ubicacionpre.find(idc)
      assert_equal 'Ráquira / Ráquira / Boyacá / Colombia', u.nombre
      assert_equal 'Ráquira / Ráquira / Boyacá', u.nombre_sin_pais

      # Vereda
      idv = Sip::Ubicacionpre.buscar_o_agregar(
        170, 11, 1013, nil, 'Vereda l', nil, nil, nil, nil) 
      assert idv > 0
      u = Sip::Ubicacionpre.find(idv)
      assert_equal 'Vereda l / Ráquira / Boyacá / Colombia', u.nombre
      assert_equal 'Vereda l / Ráquira / Boyacá', u.nombre_sin_pais

      # Finca
      idf = Sip::Ubicacionpre.buscar_o_agregar(
        170, 11, 1013, nil, 'Vereda l', 'Finca r', nil, nil, nil) 
      assert idf > 0
      u = Sip::Ubicacionpre.find(idf)
      assert_equal 'Finca r / Vereda l / Ráquira / Boyacá / Colombia', u.nombre
      assert_equal 'Finca r / Vereda l / Ráquira / Boyacá', u.nombre_sin_pais

      # Si es una vereda con nombre de centro poblado suponemos que es centro
      # poblado
      idu = Sip::Ubicacionpre.buscar_o_agregar(
        170, 11, 1013, nil, 'Ráquira', nil, nil, nil, nil) 
      assert_equal idc, idu

      # tsitio no válido
      idu = Sip::Ubicacionpre.buscar_o_agregar(
        170, 11, 1013, nil, 'Vereda l', nil, -1, nil, nil) 
      assert_nil idu

      # tsitio rural
      idu = Sip::Ubicacionpre.buscar_o_agregar(
        170, 11, 1013, nil, 'Vereda l', nil, 3, nil, nil) 
      assert_equal idv, idu

      # tsitio rural
      idu = Sip::Ubicacionpre.buscar_o_agregar(
        170, 11, 1013, nil, 'Vereda l', nil, 3, nil, nil) 
      assert_equal idv, idu

      # tsitio rural
      idu = Sip::Ubicacionpre.buscar_o_agregar(
        170, 11, 1013, nil, nil, 'Finca x', 3, nil, nil) 
      assert idu > 0






     
    end

  end
end
