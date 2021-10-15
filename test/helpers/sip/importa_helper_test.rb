require_relative '../../test_helper'
require 'sip/importa_helper'

module Sip
  class ImportaHelperTest < ActionView::TestCase

    include ImportaHelper

    test "nombre_en_tabla_basica" do
      menserror = ''
      assert_equal 'COLOMBIA', nombre_en_tabla_basica(
        Sip::Pais, 'COLOMBIA', menserror).nombre
      assert_nil nombre_en_tabla_basica(Sip::Pais, 'LOCOMBIA', menserror)
    end

    test "fecha_local_colombia_a_date" do
      menserror = ''
      assert_equal Date.new(2021,10,14), 
        fecha_local_colombia_a_date('14/Oct/2021', menserror)
    end

  end  # class
end    # module
