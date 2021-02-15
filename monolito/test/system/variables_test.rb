require "application_system_test_case"

class VariablesTest < ApplicationSystemTestCase
  setup do
    @variable = variables(:one)
  end

  test "visiting the index" do
    visit variables_url
    assert_selector "h1", text: "Variables"
  end

  test "creating a Variable" do
    visit variables_url
    click_on "New Variable"

    fill_in "Codigo variable", with: @variable.codigo_variable
    fill_in "Dato extra", with: @variable.dato_extra
    fill_in "Dato extra2", with: @variable.dato_extra2
    fill_in "Dato extra3", with: @variable.dato_extra3
    fill_in "Descricion variable", with: @variable.descricion_variable
    fill_in "Estado", with: @variable.estado
    fill_in "Fec crea", with: @variable.fec_crea
    fill_in "Fec mod", with: @variable.fec_mod
    fill_in "Tipo variable", with: @variable.tipo_variable
    fill_in "Usu crea", with: @variable.usu_crea
    fill_in "Usu mod", with: @variable.usu_mod
    click_on "Create Variable"

    assert_text "Variable was successfully created"
    click_on "Back"
  end

  test "updating a Variable" do
    visit variables_url
    click_on "Edit", match: :first

    fill_in "Codigo variable", with: @variable.codigo_variable
    fill_in "Dato extra", with: @variable.dato_extra
    fill_in "Dato extra2", with: @variable.dato_extra2
    fill_in "Dato extra3", with: @variable.dato_extra3
    fill_in "Descricion variable", with: @variable.descricion_variable
    fill_in "Estado", with: @variable.estado
    fill_in "Fec crea", with: @variable.fec_crea
    fill_in "Fec mod", with: @variable.fec_mod
    fill_in "Tipo variable", with: @variable.tipo_variable
    fill_in "Usu crea", with: @variable.usu_crea
    fill_in "Usu mod", with: @variable.usu_mod
    click_on "Update Variable"

    assert_text "Variable was successfully updated"
    click_on "Back"
  end

  test "destroying a Variable" do
    visit variables_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Variable was successfully destroyed"
  end
end
