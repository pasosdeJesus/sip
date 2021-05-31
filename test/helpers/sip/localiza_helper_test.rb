# encoding: UTF-8

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


  end  # class
end    # module
