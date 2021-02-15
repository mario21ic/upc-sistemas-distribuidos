require 'test_helper'

class VentaControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ventum = venta(:one)
  end

  test "should get index" do
    get venta_url
    assert_response :success
  end

  test "should get new" do
    get new_ventum_url
    assert_response :success
  end

  test "should create ventum" do
    assert_difference('Ventum.count') do
      post venta_url, params: { ventum: { cod_departamento: @ventum.cod_departamento, cod_solicitud: @ventum.cod_solicitud, cod_venta: @ventum.cod_venta, estado: @ventum.estado, fec_crea: @ventum.fec_crea, fec_mod: @ventum.fec_mod, numero_documento: @ventum.numero_documento, saldo: @ventum.saldo, tipo_compra: @ventum.tipo_compra, tipo_documento: @ventum.tipo_documento, total: @ventum.total, usu_crea: @ventum.usu_crea, usu_mod: @ventum.usu_mod } }
    end

    assert_redirected_to ventum_url(Ventum.last)
  end

  test "should show ventum" do
    get ventum_url(@ventum)
    assert_response :success
  end

  test "should get edit" do
    get edit_ventum_url(@ventum)
    assert_response :success
  end

  test "should update ventum" do
    patch ventum_url(@ventum), params: { ventum: { cod_departamento: @ventum.cod_departamento, cod_solicitud: @ventum.cod_solicitud, cod_venta: @ventum.cod_venta, estado: @ventum.estado, fec_crea: @ventum.fec_crea, fec_mod: @ventum.fec_mod, numero_documento: @ventum.numero_documento, saldo: @ventum.saldo, tipo_compra: @ventum.tipo_compra, tipo_documento: @ventum.tipo_documento, total: @ventum.total, usu_crea: @ventum.usu_crea, usu_mod: @ventum.usu_mod } }
    assert_redirected_to ventum_url(@ventum)
  end

  test "should destroy ventum" do
    assert_difference('Ventum.count', -1) do
      delete ventum_url(@ventum)
    end

    assert_redirected_to venta_url
  end
end
