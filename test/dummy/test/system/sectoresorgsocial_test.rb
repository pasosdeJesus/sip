require "application_system_test_case"

class SectoresorgsocialTest < ApplicationSystemTestCase

  test "Agregar buscar y eliminar sectores" do

    Sip::CapybaraHelper.iniciar_sesion(self, root_path, 'sip', 'sip')

    click_link 'Administrar'
    assert_content 'Tablas básicas'
    skip
    click_link 'Tablas básicas'
    click_link 'Sectores de organizaciones sociales'
    assert_content 'Sectores de organizaciones sociales'
    click_link 'Nuevo'
    fill_in 'Nombre', with: 'INDÍGENAS'
    fill_in 'Observaciones', with: 'Trabajo con indígenas'
    find_button('Crear').click
    assert_content 'Sip::Sectororgsocial creado.'

    click_link 'Regresar'
    click_link 'Nuevo'
    fill_in 'Nombre', with: 'CAMPESINOS'
    fill_in 'Observaciones', with: 'Trabajo con campesinos'
    find_button('Crear').click
    assert_content 'Sip::Sectororgsocial creado.'

    click_link 'Administrar'
    click_link 'Tablas básicas'
    click_link 'Sectores de organizaciones sociales'
    fill_in 'filtro_busnombre', with: 'INDÍGENAS'
    assert_content 'Sectores de organizaciones sociales: 1'
    find_button('Filtrar').click
    assert_content 'Sectores de organizaciones sociales: 1'
    accept_confirm do
      click_link 'Eliminar'
    end
    assert_content 'Sip::Sectororgsocial eliminado.'

    fill_in 'filtro_busnombre', with: 'CAMPESINOS'
    find_button('Filtrar').click
    assert_content 'Sectores de organizaciones sociales: 1'
    accept_confirm do
      click_link 'Eliminar'
    end
    assert_content 'Sip::Sectororgsocial eliminado.'
  end

end
