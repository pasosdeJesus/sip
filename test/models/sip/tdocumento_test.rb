require_relative '../../test_helper'

module Sip
  class TdocumentoTest < ActiveSupport::TestCase

    test "valido" do
      tdocumento = Tdocumento.create PRUEBA_TDOCUMENTO
      assert tdocumento.valid?
      tdocumento.destroy
    end

    test "no valido" do
      tdocumento = Tdocumento.new PRUEBA_TDOCUMENTO
      tdocumento.nombre = ''
      assert_not tdocumento.valid?
      tdocumento.destroy
    end

    test "existente" do
      tdocumento = Sip::Tdocumento.where(id: 7).take
      assert_equal tdocumento.nombre, "OTRO"
    end

  end
end
