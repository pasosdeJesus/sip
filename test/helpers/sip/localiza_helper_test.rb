require_relative '../../test_helper'
require 'sip/formato_fecha_helper'

module Sip
  class LocalizaHelperTest < ActionView::TestCase

    include LocalizaHelper

    test "simple1" do
      assert_equal 'Hola', capitaliza_titulo('hola')
      assert_equal 'Abuso de Autoridad', capitaliza_titulo('abuso de autoridad')
      assert_equal 'Abuso de Autoridad', capitaliza_titulo('ABUSO DE AUTORIDAD')
    end

    test "Extensiones a String" do
      assert_equal '3.2'.a_decimal_localizado, '3,2'
      assert_equal '3,2'.a_decimal_nolocalizado, '3.2'
    end

    test "Extensiones a Numeric" do
      assert_equal 3.2.a_decimal_localizado, '3,2'
    end

    test "Extensiones a NilClass" do
      assert_equal nil.a_decimal_localizado, '0,0'
      assert_equal nil.a_decimal_nolocalizado, '0.0'
    end

  end  # class
end    # module
