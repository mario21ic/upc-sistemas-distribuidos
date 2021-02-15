require 'test_helper'

class ArchivosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @archivo = archivos(:one)
  end

  test "should get index" do
    get archivos_url
    assert_response :success
  end

  test "should get new" do
    get new_archivo_url
    assert_response :success
  end

  test "should create archivo" do
    assert_difference('Archivo.count') do
      post archivos_url, params: { archivo: { cod_archivo: @archivo.cod_archivo, cod_departamento: @archivo.cod_departamento, cod_proyecto: @archivo.cod_proyecto, cod_tip_archivo: @archivo.cod_tip_archivo, descripcion_corta: @archivo.descripcion_corta, descripcion_larga: @archivo.descripcion_larga, estado: @archivo.estado, fec_crea: @archivo.fec_crea, fec_mod: @archivo.fec_mod, nombre_archivo: @archivo.nombre_archivo, orden: @archivo.orden, usu_crea: @archivo.usu_crea, usu_mod: @archivo.usu_mod } }
    end

    assert_redirected_to archivo_url(Archivo.last)
  end

  test "should show archivo" do
    get archivo_url(@archivo)
    assert_response :success
  end

  test "should get edit" do
    get edit_archivo_url(@archivo)
    assert_response :success
  end

  test "should update archivo" do
    patch archivo_url(@archivo), params: { archivo: { cod_archivo: @archivo.cod_archivo, cod_departamento: @archivo.cod_departamento, cod_proyecto: @archivo.cod_proyecto, cod_tip_archivo: @archivo.cod_tip_archivo, descripcion_corta: @archivo.descripcion_corta, descripcion_larga: @archivo.descripcion_larga, estado: @archivo.estado, fec_crea: @archivo.fec_crea, fec_mod: @archivo.fec_mod, nombre_archivo: @archivo.nombre_archivo, orden: @archivo.orden, usu_crea: @archivo.usu_crea, usu_mod: @archivo.usu_mod } }
    assert_redirected_to archivo_url(@archivo)
  end

  test "should destroy archivo" do
    assert_difference('Archivo.count', -1) do
      delete archivo_url(@archivo)
    end

    assert_redirected_to archivos_url
  end
end
