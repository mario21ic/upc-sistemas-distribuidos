require "application_system_test_case"

class ProyectosTest < ApplicationSystemTestCase
  setup do
    @proyecto = proyectos(:one)
  end

  test "visiting the index" do
    visit proyectos_url
    assert_selector "h1", text: "Proyectos"
  end

  test "creating a Proyecto" do
    visit proyectos_url
    click_on "New Proyecto"

    fill_in "Cod proyecto", with: @proyecto.cod_proyecto
    fill_in "Descripcion corta", with: @proyecto.descripcion_corta
    fill_in "Descripcion larga", with: @proyecto.descripcion_larga
    fill_in "Estado", with: @proyecto.estado
    fill_in "Fec crea", with: @proyecto.fec_crea
    fill_in "Fec mod", with: @proyecto.fec_mod
    fill_in "Mca favorito", with: @proyecto.mca_favorito
    fill_in "Nombre", with: @proyecto.nombre
    fill_in "Precio m2", with: @proyecto.precio_m2
    fill_in "Ubicacion", with: @proyecto.ubicacion
    fill_in "Usu crea", with: @proyecto.usu_crea
    fill_in "Usu mod", with: @proyecto.usu_mod
    click_on "Guardar"

    assert_text "Proyecto was successfully created"
    click_on "Back"
  end

  test "updating a Proyecto" do
    visit proyectos_url
    click_on "Edit", match: :first

    fill_in "Cod proyecto", with: @proyecto.cod_proyecto
    fill_in "Descripcion corta", with: @proyecto.descripcion_corta
    fill_in "Descripcion larga", with: @proyecto.descripcion_larga
    fill_in "Estado", with: @proyecto.estado
    fill_in "Fec crea", with: @proyecto.fec_crea
    fill_in "Fec mod", with: @proyecto.fec_mod
    fill_in "Mca favorito", with: @proyecto.mca_favorito
    fill_in "Nombre", with: @proyecto.nombre
    fill_in "Precio m2", with: @proyecto.precio_m2
    fill_in "Ubicacion", with: @proyecto.ubicacion
    fill_in "Usu crea", with: @proyecto.usu_crea
    fill_in "Usu mod", with: @proyecto.usu_mod
    click_on "Update Proyecto"

    assert_text "Proyecto was successfully updated"
    click_on "Back"
  end

  test "destroying a Proyecto" do
    visit proyectos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Proyecto was successfully destroyed"
  end
end
