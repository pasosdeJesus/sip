require_relative '../../test_helper'

module Sip
  class SolicitudTest < ActiveSupport::TestCase

    test "valido" do
      solicitud = Sip::Solicitud.new PRUEBA_SOLICITUD
      assert solicitud.valid?
      solicitud.save!
      solicitud.destroy
    end

    test "no valido" do
      solicitud = Sip::Solicitud.new PRUEBA_SOLICITUD
      solicitud.solicitud = ''
      assert_not solicitud.valid?
      solicitud.destroy
    end

  end
end
