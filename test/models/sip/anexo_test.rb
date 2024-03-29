require_relative '../../test_helper'

module Sip
  class AnexoTest < ActiveSupport::TestCase

    test "simple" do
      anexo = Anexo.new PRUEBA_ANEXO
      anexo.adjunto = File.new(Rails.root + 'db/seeds.rb')
      assert anexo.valid?
    end

    test "no valido 1" do
      anexo = Anexo.new PRUEBA_ANEXO
      assert_not anexo.valid?
    end

    test "no valido 2" do
      anexo = Anexo.new PRUEBA_ANEXO
      anexo.descripcion = nil 
      assert_not anexo.valid?
      anexo.destroy
    end
  end
end
