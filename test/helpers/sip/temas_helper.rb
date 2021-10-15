require_relative '../../test_helper'
require 'sip/temas_helper'

module Sip
  class TemasHelperTest < ActionView::TestCase

    include TemasHelper

    test "temas_usuario" do
      t = tema_usuario(nil)
      assert_equal Sip::Tema.find(1), t
      u=Usuario.find(1)
      u.tema_id = 1
      u.save
      assert_equal Sip::Tema.find(1), tema_usuario(Usuario.find(1))
    end

  end  # class
end    # module
