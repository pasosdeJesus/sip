require_relative '../../test_helper'

module Sip
  class TclaseTest < ActiveSupport::TestCase

    test "valido" do
      tclase = Tclase.create PRUEBA_TCLASE
      assert tclase.valid?
      tclase.destroy
    end

    test "no valido" do
      tclase = Tclase.new PRUEBA_TCLASE
      tclase.nombre = ''
      assert_not tclase.valid?
      tclase.destroy
    end

    test "existente" do
      tclase = Sip::Tclase.where(id: 'C').take
      assert_equal tclase.nombre, "CORREGIMIENTO"
    end

  end
end
