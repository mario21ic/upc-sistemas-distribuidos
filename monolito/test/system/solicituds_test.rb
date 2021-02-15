require "application_system_test_case"

class SolicitudsTest < ApplicationSystemTestCase
  setup do
    @solicitud = solicituds(:one)
  end

  test "visiting the index" do
    visit solicituds_url
    assert_selector "h1", text: "Solicituds"
  end

  test "creating a Solicitud" do
    visit solicituds_url
    click_on "New Solicitud"

    fill_in "Apellidos", with: @solicitud.apellidos
    fill_in "Cod departamento", with: @solicitud.cod_departamento
    fill_in "Cod solictud", with: @solicitud.cod_solictud
    fill_in "Correo", with: @solicitud.correo
    fill_in "Estado", with: @solicitud.estado
    fill_in "Fec crea", with: @solicitud.fec_crea
    fill_in "Fec mod", with: @solicitud.fec_mod
    fill_in "Mensaje", with: @solicitud.mensaje
    fill_in "Nombres", with: @solicitud.nombres
    fill_in "Numero documento", with: @solicitud.numero_documento
    fill_in "Telefono", with: @solicitud.telefono
    fill_in "Tipo documento", with: @solicitud.tipo_documento
    fill_in "Usu crea", with: @solicitud.usu_crea
    fill_in "Usu mod", with: @solicitud.usu_mod
    click_on "Create Solicitud"

    assert_text "Solicitud was successfully created"
    click_on "Back"
  end

  test "updating a Solicitud" do
    visit solicituds_url
    click_on "Edit", match: :first

    fill_in "Apellidos", with: @solicitud.apellidos
    fill_in "Cod departamento", with: @solicitud.cod_departamento
    fill_in "Cod solictud", with: @solicitud.cod_solictud
    fill_in "Correo", with: @solicitud.correo
    fill_in "Estado", with: @solicitud.estado
    fill_in "Fec crea", with: @solicitud.fec_crea
    fill_in "Fec mod", with: @solicitud.fec_mod
    fill_in "Mensaje", with: @solicitud.mensaje
    fill_in "Nombres", with: @solicitud.nombres
    fill_in "Numero documento", with: @solicitud.numero_documento
    fill_in "Telefono", with: @solicitud.telefono
    fill_in "Tipo documento", with: @solicitud.tipo_documento
    fill_in "Usu crea", with: @solicitud.usu_crea
    fill_in "Usu mod", with: @solicitud.usu_mod
    click_on "Update Solicitud"

    assert_text "Solicitud was successfully updated"
    click_on "Back"
  end

  test "destroying a Solicitud" do
    visit solicituds_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Solicitud was successfully destroyed"
  end
end
