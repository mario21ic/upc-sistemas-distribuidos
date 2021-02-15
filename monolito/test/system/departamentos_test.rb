require "application_system_test_case"

class DepartamentosTest < ApplicationSystemTestCase
  setup do
    @departamento = departamentos(:one)
  end

  test "visiting the index" do
    visit departamentos_url
    assert_selector "h1", text: "Departamentos"
  end

  test "creating a Departamento" do
    visit departamentos_url
    click_on "New Departamento"

    fill_in "Area techada", with: @departamento.area_techada
    fill_in "Area total", with: @departamento.area_total
    fill_in "Baños", with: @departamento.baños
    fill_in "Cod departamento", with: @departamento.cod_departamento
    fill_in "Cod proyecto", with: @departamento.cod_proyecto
    fill_in "Descripcion corta", with: @departamento.descripcion_corta
    fill_in "Descripcion larga", with: @departamento.descripcion_larga
    fill_in "Dormitorios", with: @departamento.dormitorios
    fill_in "Estado", with: @departamento.estado
    fill_in "Fec crea", with: @departamento.fec_crea
    fill_in "Fec mod", with: @departamento.fec_mod
    fill_in "Mca favorito", with: @departamento.mca_favorito
    fill_in "Numero", with: @departamento.numero
    fill_in "Piso", with: @departamento.piso
    fill_in "Usu crea", with: @departamento.usu_crea
    fill_in "Usu mod", with: @departamento.usu_mod
    click_on "Create Departamento"

    assert_text "Departamento was successfully created"
    click_on "Back"
  end

  test "updating a Departamento" do
    visit departamentos_url
    click_on "Edit", match: :first

    fill_in "Area techada", with: @departamento.area_techada
    fill_in "Area total", with: @departamento.area_total
    fill_in "Baños", with: @departamento.baños
    fill_in "Cod departamento", with: @departamento.cod_departamento
    fill_in "Cod proyecto", with: @departamento.cod_proyecto
    fill_in "Descripcion corta", with: @departamento.descripcion_corta
    fill_in "Descripcion larga", with: @departamento.descripcion_larga
    fill_in "Dormitorios", with: @departamento.dormitorios
    fill_in "Estado", with: @departamento.estado
    fill_in "Fec crea", with: @departamento.fec_crea
    fill_in "Fec mod", with: @departamento.fec_mod
    fill_in "Mca favorito", with: @departamento.mca_favorito
    fill_in "Numero", with: @departamento.numero
    fill_in "Piso", with: @departamento.piso
    fill_in "Usu crea", with: @departamento.usu_crea
    fill_in "Usu mod", with: @departamento.usu_mod
    click_on "Update Departamento"

    assert_text "Departamento was successfully updated"
    click_on "Back"
  end

  test "destroying a Departamento" do
    visit departamentos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Departamento was successfully destroyed"
  end
end
