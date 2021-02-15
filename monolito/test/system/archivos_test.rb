require "application_system_test_case"

class ArchivosTest < ApplicationSystemTestCase
  setup do
    @archivo = archivos(:one)
  end

  test "visiting the index" do
    visit archivos_url
    assert_selector "h1", text: "Archivos"
  end

  test "creating a Archivo" do
    visit archivos_url
    click_on "New Archivo"

    fill_in "Cod archivo", with: @archivo.cod_archivo
    fill_in "Cod departamento", with: @archivo.cod_departamento
    fill_in "Cod proyecto", with: @archivo.cod_proyecto
    fill_in "Cod tip archivo", with: @archivo.cod_tip_archivo
    fill_in "Descripcion corta", with: @archivo.descripcion_corta
    fill_in "Descripcion larga", with: @archivo.descripcion_larga
    fill_in "Estado", with: @archivo.estado
    fill_in "Fec crea", with: @archivo.fec_crea
    fill_in "Fec mod", with: @archivo.fec_mod
    fill_in "Nombre archivo", with: @archivo.nombre_archivo
    fill_in "Orden", with: @archivo.orden
    fill_in "Usu crea", with: @archivo.usu_crea
    fill_in "Usu mod", with: @archivo.usu_mod
    click_on "Create Archivo"

    assert_text "Archivo was successfully created"
    click_on "Back"
  end

  test "updating a Archivo" do
    visit archivos_url
    click_on "Edit", match: :first

    fill_in "Cod archivo", with: @archivo.cod_archivo
    fill_in "Cod departamento", with: @archivo.cod_departamento
    fill_in "Cod proyecto", with: @archivo.cod_proyecto
    fill_in "Cod tip archivo", with: @archivo.cod_tip_archivo
    fill_in "Descripcion corta", with: @archivo.descripcion_corta
    fill_in "Descripcion larga", with: @archivo.descripcion_larga
    fill_in "Estado", with: @archivo.estado
    fill_in "Fec crea", with: @archivo.fec_crea
    fill_in "Fec mod", with: @archivo.fec_mod
    fill_in "Nombre archivo", with: @archivo.nombre_archivo
    fill_in "Orden", with: @archivo.orden
    fill_in "Usu crea", with: @archivo.usu_crea
    fill_in "Usu mod", with: @archivo.usu_mod
    click_on "Update Archivo"

    assert_text "Archivo was successfully updated"
    click_on "Back"
  end

  test "destroying a Archivo" do
    visit archivos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Archivo was successfully destroyed"
  end
end
