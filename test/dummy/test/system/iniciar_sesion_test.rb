require "application_system_test_case"

class IniciarSesionTest < ApplicationSystemTestCase

  test "iniciar sesión" do
    visit root_url
    assert_content 'Pasos de Jesús'
    click_link 'Iniciar Sesión'
    assert_content 'Usuario'
    fill_in('Usuario', with: 'sip')
    fill_in('Clave', with: 'sip')
    find_button('Iniciar Sesión').click
    assert_content 'Sesión iniciada.'
  end

end
