require 'test_helper'

class MovimimientoVentaControllerTest < ActionDispatch::IntegrationTest
  setup do
    @movimimiento_ventum = movimimiento_venta(:one)
  end

  test "should get index" do
    get movimimiento_venta_url
    assert_response :success
  end

  test "should get new" do
    get new_movimimiento_ventum_url
    assert_response :success
  end

  test "should create movimimiento_ventum" do
    assert_difference('MovimimientoVentum.count') do
      post movimimiento_venta_url, params: { movimimiento_ventum: { cod_venta: @movimimiento_ventum.cod_venta, estado: @movimimiento_ventum.estado, fec_crea: @movimimiento_ventum.fec_crea, fec_mod: @movimimiento_ventum.fec_mod, monto: @movimimiento_ventum.monto, numero_movimiento: @movimimiento_ventum.numero_movimiento, numero_operacion: @movimimiento_ventum.numero_operacion, tipo_movimiento: @movimimiento_ventum.tipo_movimiento, usu_crea: @movimimiento_ventum.usu_crea, usu_mod: @movimimiento_ventum.usu_mod } }
    end

    assert_redirected_to movimimiento_ventum_url(MovimimientoVentum.last)
  end

  test "should show movimimiento_ventum" do
    get movimimiento_ventum_url(@movimimiento_ventum)
    assert_response :success
  end

  test "should get edit" do
    get edit_movimimiento_ventum_url(@movimimiento_ventum)
    assert_response :success
  end

  test "should update movimimiento_ventum" do
    patch movimimiento_ventum_url(@movimimiento_ventum), params: { movimimiento_ventum: { cod_venta: @movimimiento_ventum.cod_venta, estado: @movimimiento_ventum.estado, fec_crea: @movimimiento_ventum.fec_crea, fec_mod: @movimimiento_ventum.fec_mod, monto: @movimimiento_ventum.monto, numero_movimiento: @movimimiento_ventum.numero_movimiento, numero_operacion: @movimimiento_ventum.numero_operacion, tipo_movimiento: @movimimiento_ventum.tipo_movimiento, usu_crea: @movimimiento_ventum.usu_crea, usu_mod: @movimimiento_ventum.usu_mod } }
    assert_redirected_to movimimiento_ventum_url(@movimimiento_ventum)
  end

  test "should destroy movimimiento_ventum" do
    assert_difference('MovimimientoVentum.count', -1) do
      delete movimimiento_ventum_url(@movimimiento_ventum)
    end

    assert_redirected_to movimimiento_venta_url
  end
end
