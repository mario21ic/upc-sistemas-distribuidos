require 'test_helper'

class DepartamentosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @departamento = departamentos(:one)
  end

  test "should get index" do
    get departamentos_url
    assert_response :success
  end

  test "should get new" do
    get new_departamento_url
    assert_response :success
  end

  test "should create departamento" do
    assert_difference('Departamento.count') do
      post departamentos_url, params: { departamento: { area_techada: @departamento.area_techada, area_total: @departamento.area_total, baños: @departamento.baños, cod_departamento: @departamento.cod_departamento, cod_proyecto: @departamento.cod_proyecto, descripcion_corta: @departamento.descripcion_corta, descripcion_larga: @departamento.descripcion_larga, dormitorios: @departamento.dormitorios, estado: @departamento.estado, fec_crea: @departamento.fec_crea, fec_mod: @departamento.fec_mod, mca_favorito: @departamento.mca_favorito, numero: @departamento.numero, piso: @departamento.piso, usu_crea: @departamento.usu_crea, usu_mod: @departamento.usu_mod } }
    end

    assert_redirected_to departamento_url(Departamento.last)
  end

  test "should show departamento" do
    get departamento_url(@departamento)
    assert_response :success
  end

  test "should get edit" do
    get edit_departamento_url(@departamento)
    assert_response :success
  end

  test "should update departamento" do
    patch departamento_url(@departamento), params: { departamento: { area_techada: @departamento.area_techada, area_total: @departamento.area_total, baños: @departamento.baños, cod_departamento: @departamento.cod_departamento, cod_proyecto: @departamento.cod_proyecto, descripcion_corta: @departamento.descripcion_corta, descripcion_larga: @departamento.descripcion_larga, dormitorios: @departamento.dormitorios, estado: @departamento.estado, fec_crea: @departamento.fec_crea, fec_mod: @departamento.fec_mod, mca_favorito: @departamento.mca_favorito, numero: @departamento.numero, piso: @departamento.piso, usu_crea: @departamento.usu_crea, usu_mod: @departamento.usu_mod } }
    assert_redirected_to departamento_url(@departamento)
  end

  test "should destroy departamento" do
    assert_difference('Departamento.count', -1) do
      delete departamento_url(@departamento)
    end

    assert_redirected_to departamentos_url
  end
end
