require "application_system_test_case"

class UsuariosTest < ApplicationSystemTestCase
  setup do
    @usuario = usuarios(:one)
  end

  test "visiting the index" do
    visit usuarios_url
    assert_selector "h1", text: "Usuarios"
  end

  test "creating a Usuario" do
    visit usuarios_url
    click_on "New Usuario"

    fill_in "Codigo usuario", with: @usuario.codigo_usuario
    fill_in "Contraseña", with: @usuario.contraseña
    fill_in "Correo corporativo", with: @usuario.correo_corporativo
    fill_in "Estado", with: @usuario.estado
    fill_in "Fec crea", with: @usuario.fec_crea
    fill_in "Fec mod", with: @usuario.fec_mod
    fill_in "Numero documento", with: @usuario.numero_documento
    fill_in "Perfil", with: @usuario.perfil
    fill_in "Tipo documento", with: @usuario.tipo_documento
    fill_in "Usu crea", with: @usuario.usu_crea
    fill_in "Usu mod", with: @usuario.usu_mod
    click_on "Create Usuario"

    assert_text "Usuario was successfully created"
    click_on "Back"
  end

  test "updating a Usuario" do
    visit usuarios_url
    click_on "Edit", match: :first

    fill_in "Codigo usuario", with: @usuario.codigo_usuario
    fill_in "Contraseña", with: @usuario.contraseña
    fill_in "Correo corporativo", with: @usuario.correo_corporativo
    fill_in "Estado", with: @usuario.estado
    fill_in "Fec crea", with: @usuario.fec_crea
    fill_in "Fec mod", with: @usuario.fec_mod
    fill_in "Numero documento", with: @usuario.numero_documento
    fill_in "Perfil", with: @usuario.perfil
    fill_in "Tipo documento", with: @usuario.tipo_documento
    fill_in "Usu crea", with: @usuario.usu_crea
    fill_in "Usu mod", with: @usuario.usu_mod
    click_on "Update Usuario"

    assert_text "Usuario was successfully updated"
    click_on "Back"
  end

  test "destroying a Usuario" do
    visit usuarios_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Usuario was successfully destroyed"
  end
end
