require "application_system_test_case"

class CaracteristicasProyectosTest < ApplicationSystemTestCase
  setup do
    @caracteristicas_proyecto = caracteristicas_proyectos(:one)
  end

  test "visiting the index" do
    visit caracteristicas_proyectos_url
    assert_selector "h1", text: "Caracteristicas Proyectos"
  end

  test "creating a Caracteristicas proyecto" do
    visit caracteristicas_proyectos_url
    click_on "New Caracteristicas Proyecto"

    fill_in "Cod caracteristica", with: @caracteristicas_proyecto.cod_caracteristica
    fill_in "Cod proyecto", with: @caracteristicas_proyecto.cod_proyecto
    fill_in "Estado", with: @caracteristicas_proyecto.estado
    fill_in "Fec crea", with: @caracteristicas_proyecto.fec_crea
    fill_in "Fec mod", with: @caracteristicas_proyecto.fec_mod
    fill_in "Usu crea", with: @caracteristicas_proyecto.usu_crea
    fill_in "Usu mod", with: @caracteristicas_proyecto.usu_mod
    click_on "Create Caracteristicas proyecto"

    assert_text "Caracteristicas proyecto was successfully created"
    click_on "Back"
  end

  test "updating a Caracteristicas proyecto" do
    visit caracteristicas_proyectos_url
    click_on "Edit", match: :first

    fill_in "Cod caracteristica", with: @caracteristicas_proyecto.cod_caracteristica
    fill_in "Cod proyecto", with: @caracteristicas_proyecto.cod_proyecto
    fill_in "Estado", with: @caracteristicas_proyecto.estado
    fill_in "Fec crea", with: @caracteristicas_proyecto.fec_crea
    fill_in "Fec mod", with: @caracteristicas_proyecto.fec_mod
    fill_in "Usu crea", with: @caracteristicas_proyecto.usu_crea
    fill_in "Usu mod", with: @caracteristicas_proyecto.usu_mod
    click_on "Update Caracteristicas proyecto"

    assert_text "Caracteristicas proyecto was successfully updated"
    click_on "Back"
  end

  test "destroying a Caracteristicas proyecto" do
    visit caracteristicas_proyectos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Caracteristicas proyecto was successfully destroyed"
  end
end
