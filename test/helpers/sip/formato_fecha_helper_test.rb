# encoding: UTF-8

require_relative '../../test_helper'
require 'sip/formato_fecha_helper'

module Sip
  class FormatoFechaHelperTest < ActionView::TestCase

    include FormatoFechaHelper

    test "simple1" do
      d = Date.strptime('2017-12-18', '%Y-%m-%d')
      f1 = fecha_estandar_local(d)
      f2 = fecha_estandar_local('2017-12-18')
      assert_equal f1, f2
    end

    test "simple2" do
      Rails.application.config.x.formato_fecha = 'dd/M/yyyy'
      f1 = fecha_local_estandar('03/May/2018')
      assert_equal f1, '2018-05-03'
    end

    test "simple3" do
      Rails.application.config.x.formato_fecha = 'dd-M-yyyy'
      f1 = fecha_local_estandar('03-May-2018')
      assert_equal f1, '2018-05-03'
    end



  end  # class
end    # module
