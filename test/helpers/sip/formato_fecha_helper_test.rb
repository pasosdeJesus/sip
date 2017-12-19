# encoding: UTF-8

require_relative '../../test_helper'
require 'sip/formato_fecha_helper'

module Sip
  class FormatoFechaHelperTest < ActionView::TestCase

    include FormatoFechaHelper

    test "simple" do
      d = Date.strptime('2017-12-18', '%Y-%m-%d')
      f1 = fecha_estandar_local(d)
      f2 = fecha_estandar_local('2017-12-18')
      assert_equal f1, f2
    end

  end  # class
end    # module
