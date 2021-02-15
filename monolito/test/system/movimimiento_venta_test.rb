require "application_system_test_case"

class MovimimientoVentaTest < ApplicationSystemTestCase
  setup do
    @movimimiento_ventum = movimimiento_venta(:one)
  end

  test "visiting the index" do
    visit movimimiento_venta_url
    assert_selector "h1", text: "Movimimiento Venta"
  end

  test "creating a Movimimiento ventum" do
    visit movimimiento_venta_url
    click_on "New Movimimiento Ventum"

    fill_in "Cod venta", with: @movimimiento_ventum.cod_venta
    fill_in "Estado", with: @movimimiento_ventum.estado
    fill_in "Fec crea", with: @movimimiento_ventum.fec_crea
    fill_in "Fec mod", with: @movimimiento_ventum.fec_mod
    fill_in "Monto", with: @movimimiento_ventum.monto
    fill_in "Numero movimiento", with: @movimimiento_ventum.numero_movimiento
    fill_in "Numero operacion", with: @movimimiento_ventum.numero_operacion
    fill_in "Tipo movimiento", with: @movimimiento_ventum.tipo_movimiento
    fill_in "Usu crea", with: @movimimiento_ventum.usu_crea
    fill_in "Usu mod", with: @movimimiento_ventum.usu_mod
    click_on "Create Movimimiento ventum"

    assert_text "Movimimiento ventum was successfully created"
    click_on "Back"
  end

  test "updating a Movimimiento ventum" do
    visit movimimiento_venta_url
    click_on "Edit", match: :first

    fill_in "Cod venta", with: @movimimiento_ventum.cod_venta
    fill_in "Estado", with: @movimimiento_ventum.estado
    fill_in "Fec crea", with: @movimimiento_ventum.fec_crea
    fill_in "Fec mod", with: @movimimiento_ventum.fec_mod
    fill_in "Monto", with: @movimimiento_ventum.monto
    fill_in "Numero movimiento", with: @movimimiento_ventum.numero_movimiento
    fill_in "Numero operacion", with: @movimimiento_ventum.numero_operacion
    fill_in "Tipo movimiento", with: @movimimiento_ventum.tipo_movimiento
    fill_in "Usu crea", with: @movimimiento_ventum.usu_crea
    fill_in "Usu mod", with: @movimimiento_ventum.usu_mod
    click_on "Update Movimimiento ventum"

    assert_text "Movimimiento ventum was successfully updated"
    click_on "Back"
  end

  test "destroying a Movimimiento ventum" do
    visit movimimiento_venta_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Movimimiento ventum was successfully destroyed"
  end
end
