require "application_system_test_case"

class VentaTest < ApplicationSystemTestCase
  setup do
    @ventum = venta(:one)
  end

  test "visiting the index" do
    visit venta_url
    assert_selector "h1", text: "Venta"
  end

  test "creating a Ventum" do
    visit venta_url
    click_on "New Ventum"

    fill_in "Cod departamento", with: @ventum.cod_departamento
    fill_in "Cod solicitud", with: @ventum.cod_solicitud
    fill_in "Cod venta", with: @ventum.cod_venta
    fill_in "Estado", with: @ventum.estado
    fill_in "Fec crea", with: @ventum.fec_crea
    fill_in "Fec mod", with: @ventum.fec_mod
    fill_in "Numero documento", with: @ventum.numero_documento
    fill_in "Saldo", with: @ventum.saldo
    fill_in "Tipo compra", with: @ventum.tipo_compra
    fill_in "Tipo documento", with: @ventum.tipo_documento
    fill_in "Total", with: @ventum.total
    fill_in "Usu crea", with: @ventum.usu_crea
    fill_in "Usu mod", with: @ventum.usu_mod
    click_on "Create Ventum"

    assert_text "Ventum was successfully created"
    click_on "Back"
  end

  test "updating a Ventum" do
    visit venta_url
    click_on "Edit", match: :first

    fill_in "Cod departamento", with: @ventum.cod_departamento
    fill_in "Cod solicitud", with: @ventum.cod_solicitud
    fill_in "Cod venta", with: @ventum.cod_venta
    fill_in "Estado", with: @ventum.estado
    fill_in "Fec crea", with: @ventum.fec_crea
    fill_in "Fec mod", with: @ventum.fec_mod
    fill_in "Numero documento", with: @ventum.numero_documento
    fill_in "Saldo", with: @ventum.saldo
    fill_in "Tipo compra", with: @ventum.tipo_compra
    fill_in "Tipo documento", with: @ventum.tipo_documento
    fill_in "Total", with: @ventum.total
    fill_in "Usu crea", with: @ventum.usu_crea
    fill_in "Usu mod", with: @ventum.usu_mod
    click_on "Update Ventum"

    assert_text "Ventum was successfully updated"
    click_on "Back"
  end

  test "destroying a Ventum" do
    visit venta_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Ventum was successfully destroyed"
  end
end
