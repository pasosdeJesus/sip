require "application_system_test_case"

class SectoresorgsocialTest < ApplicationSystemTestCase

  def quitar_chosen
    execute_script("$('.chosen-select').removeAttr('style')")
    execute_script("$('.chosen-container').remove()")
    execute_script("$('.chosen-select').removeClass('chosen-select') ")
  end

  test "Agregar buscar y eliminar organizaciones sociales" do

    Sip::CapybaraHelper.iniciar_sesion(self, root_path, 'sip', 'sip')

    click_link 'Administrar'
    click_link 'Tablas básicas'
    click_link 'Sectores de organizaciones sociales'
    assert_content 'Sectores de organizaciones sociales'
    click_link 'Nuevo'
    fill_in 'Nombre', with: 'INDÍGENAS'
    fill_in 'Observaciones', with: 'Trabajo con indígenas'
    find_button('Crear').click
    assert_content 'Sip::Sectororgsocial creado.'

    click_link 'Organizaciones sociales'
    click_link 'Nueva'
    fill_in 'Nombre', with: 'ACIN'
    fill_in 'Anotaciones', with: 'Organización de indígenas'
    # Quitamos chosen para facilitarle a capybara elegir de cuadro de selección
    quitar_chosen
    select 'INDÍGENAS', from: 'Sector(es)'
    find_button('Crear').click
    assert_content 'Sip::Orgsocial creada.'
    
    click_link 'Editar'
    click_link 'Añadir contacto'
    find(:id, /persona_attributes_nombres$/).fill_in with: 'Juan'
    find(:id, /persona_attributes_apellidos$/).fill_in with: 'Pérez'
    find(:id, /persona_attributes_sexo$/).select 'M'
    find_button('Actualizar').click
    assert_content 'Sip::Orgsocial actualizada.'

    click_link 'Organizaciones sociales'
    assert_content 'Organizaciones sociales: 1'
    click_link 'Editar'
    # unselect 'INDÍGENAS', from: 'Sector(es)'
    # no opera segundo intento de quitar chosen
    within '.orgsocial_sectororgsocial' do
      find('.search-choice-close').click
    end
    click_link 'Eliminar'
    find_button('Actualizar').click
    assert_content 'Sip::Orgsocial actualizada.'

    click_link 'Organizaciones sociales'
    assert_content 'Organizaciones sociales: 1'
    accept_confirm do
      click_link 'Eliminar'
    end
    assert_content 'Sip::Orgsocial eliminada.'

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

  end

end
