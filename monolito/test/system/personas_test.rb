require "application_system_test_case"

class PersonasTest < ApplicationSystemTestCase
  setup do
    @persona = personas(:one)
  end

  test "visiting the index" do
    visit personas_url
    assert_selector "h1", text: "Personas"
  end

  test "creating a Persona" do
    visit personas_url
    click_on "New Persona"

    fill_in "Apellidos", with: @persona.apellidos
    fill_in "Correo", with: @persona.correo
    fill_in "Date", with: @persona.date
    fill_in "Estado", with: @persona.estado
    fill_in "Fec crea", with: @persona.fec_crea
    fill_in "Fec mod", with: @persona.fec_mod
    fill_in "Fecha aniversario", with: @persona.fecha_aniversario
    fill_in "Mca juridico", with: @persona.mca_juridico
    fill_in "Nombres", with: @persona.nombres
    fill_in "Numero documento", with: @persona.numero_documento
    fill_in "Sexo", with: @persona.sexo
    fill_in "Telefono", with: @persona.telefono
    fill_in "Tipo documento", with: @persona.tipo_documento
    fill_in "Usu crea", with: @persona.usu_crea
    fill_in "Usu mod", with: @persona.usu_mod
    click_on "Create Persona"

    assert_text "Persona was successfully created"
    click_on "Back"
  end

  test "updating a Persona" do
    visit personas_url
    click_on "Edit", match: :first

    fill_in "Apellidos", with: @persona.apellidos
    fill_in "Correo", with: @persona.correo
    fill_in "Date", with: @persona.date
    fill_in "Estado", with: @persona.estado
    fill_in "Fec crea", with: @persona.fec_crea
    fill_in "Fec mod", with: @persona.fec_mod
    fill_in "Fecha aniversario", with: @persona.fecha_aniversario
    fill_in "Mca juridico", with: @persona.mca_juridico
    fill_in "Nombres", with: @persona.nombres
    fill_in "Numero documento", with: @persona.numero_documento
    fill_in "Sexo", with: @persona.sexo
    fill_in "Telefono", with: @persona.telefono
    fill_in "Tipo documento", with: @persona.tipo_documento
    fill_in "Usu crea", with: @persona.usu_crea
    fill_in "Usu mod", with: @persona.usu_mod
    click_on "Update Persona"

    assert_text "Persona was successfully updated"
    click_on "Back"
  end

  test "destroying a Persona" do
    visit personas_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Persona was successfully destroyed"
  end
end
