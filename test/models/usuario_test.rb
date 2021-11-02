
require_relative '../test_helper'

class UsuarioTest < ActiveSupport::TestCase

  test "valido" do
		usuario = Usuario.create PRUEBA_USUARIO
		assert usuario.valid?
		usuario.destroy
	end

  test "no valido" do
		usuario = Usuario.new PRUEBA_USUARIO
    usuario.nusuario = ''
		assert_not usuario.valid?
		usuario.destroy
	end

end
