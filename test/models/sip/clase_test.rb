# encoding: UTF-8
require_relative '../../test_helper'

module Sip
	class ClaseTest < ActiveSupport::TestCase

    PRUEBA_CLASE= {
      id: 100000,
      nombre: "CLASE1",
      latitud: 1.5,
      longitud: 1.5,
      fechacreacion: "2014-08-04",
      fechadeshabilitacion: "2014-08-04",
      id_municipio: 1,
      id_tclase: 'CAS'
    }

		test "valido" do
			clase = Clase.create PRUEBA_CLASE
			assert clase.valid?
			clase.destroy!
		end

		test "no valido" do
			clase = Clase.new PRUEBA_CLASE
      clase.nombre = ''
			assert_not clase.valid?
			clase.destroy
		end

		test "existente" do
			clase = Sip::Clase.where(id: 217).take
			assert_equal clase.nombre, "CARACAS"
		end

	end
end
