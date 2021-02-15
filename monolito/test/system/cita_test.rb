require "application_system_test_case"

class CitaTest < ApplicationSystemTestCase
  setup do
    @citum = cita(:one)
  end

  test "visiting the index" do
    visit cita_url
    assert_selector "h1", text: "Cita"
  end

  test "creating a Citum" do
    visit cita_url
    click_on "New Citum"

    fill_in "Cod cita", with: @citum.cod_cita
    fill_in "Cod solicitud", with: @citum.cod_solicitud
    fill_in "Estado", with: @citum.estado
    fill_in "Fec crea", with: @citum.fec_crea
    fill_in "Fec mod", with: @citum.fec_mod
    fill_in "Fecha", with: @citum.fecha
    fill_in "Usu crea", with: @citum.usu_crea
    fill_in "Usu mod", with: @citum.usu_mod
    click_on "Create Citum"

    assert_text "Citum was successfully created"
    click_on "Back"
  end

  test "updating a Citum" do
    visit cita_url
    click_on "Edit", match: :first

    fill_in "Cod cita", with: @citum.cod_cita
    fill_in "Cod solicitud", with: @citum.cod_solicitud
    fill_in "Estado", with: @citum.estado
    fill_in "Fec crea", with: @citum.fec_crea
    fill_in "Fec mod", with: @citum.fec_mod
    fill_in "Fecha", with: @citum.fecha
    fill_in "Usu crea", with: @citum.usu_crea
    fill_in "Usu mod", with: @citum.usu_mod
    click_on "Update Citum"

    assert_text "Citum was successfully updated"
    click_on "Back"
  end

  test "destroying a Citum" do
    visit cita_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Citum was successfully destroyed"
  end
end
