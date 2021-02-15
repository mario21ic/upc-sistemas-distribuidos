require "application_system_test_case"

class ProformasTest < ApplicationSystemTestCase
  setup do
    @proforma = proformas(:one)
  end

  test "visiting the index" do
    visit proformas_url
    assert_selector "h1", text: "Proformas"
  end

  test "creating a Proforma" do
    visit proformas_url
    click_on "New Proforma"

    fill_in "Cod proforma", with: @proforma.cod_proforma
    fill_in "Cod solictud", with: @proforma.cod_solictud
    fill_in "Estado", with: @proforma.estado
    fill_in "Fec crea", with: @proforma.fec_crea
    fill_in "Fec mod", with: @proforma.fec_mod
    fill_in "Usu crea", with: @proforma.usu_crea
    fill_in "Usu mod", with: @proforma.usu_mod
    click_on "Create Proforma"

    assert_text "Proforma was successfully created"
    click_on "Back"
  end

  test "updating a Proforma" do
    visit proformas_url
    click_on "Edit", match: :first

    fill_in "Cod proforma", with: @proforma.cod_proforma
    fill_in "Cod solictud", with: @proforma.cod_solictud
    fill_in "Estado", with: @proforma.estado
    fill_in "Fec crea", with: @proforma.fec_crea
    fill_in "Fec mod", with: @proforma.fec_mod
    fill_in "Usu crea", with: @proforma.usu_crea
    fill_in "Usu mod", with: @proforma.usu_mod
    click_on "Update Proforma"

    assert_text "Proforma was successfully updated"
    click_on "Back"
  end

  test "destroying a Proforma" do
    visit proformas_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Proforma was successfully destroyed"
  end
end
