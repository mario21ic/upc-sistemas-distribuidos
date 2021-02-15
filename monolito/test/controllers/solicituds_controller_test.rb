require 'test_helper'

class SolicitudsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @solicitud = solicituds(:one)
  end

  test "should get index" do
    get solicituds_url
    assert_response :success
  end

  test "should get new" do
    get new_solicitud_url
    assert_response :success
  end

  test "should create solicitud" do
    assert_difference('Solicitud.count') do
      post solicituds_url, params: { solicitud: { apellidos: @solicitud.apellidos, cod_departamento: @solicitud.cod_departamento, cod_solictud: @solicitud.cod_solictud, correo: @solicitud.correo, estado: @solicitud.estado, fec_crea: @solicitud.fec_crea, fec_mod: @solicitud.fec_mod, mensaje: @solicitud.mensaje, nombres: @solicitud.nombres, numero_documento: @solicitud.numero_documento, telefono: @solicitud.telefono, tipo_documento: @solicitud.tipo_documento, usu_crea: @solicitud.usu_crea, usu_mod: @solicitud.usu_mod } }
    end

    assert_redirected_to solicitud_url(Solicitud.last)
  end

  test "should show solicitud" do
    get solicitud_url(@solicitud)
    assert_response :success
  end

  test "should get edit" do
    get edit_solicitud_url(@solicitud)
    assert_response :success
  end

  test "should update solicitud" do
    patch solicitud_url(@solicitud), params: { solicitud: { apellidos: @solicitud.apellidos, cod_departamento: @solicitud.cod_departamento, cod_solictud: @solicitud.cod_solictud, correo: @solicitud.correo, estado: @solicitud.estado, fec_crea: @solicitud.fec_crea, fec_mod: @solicitud.fec_mod, mensaje: @solicitud.mensaje, nombres: @solicitud.nombres, numero_documento: @solicitud.numero_documento, telefono: @solicitud.telefono, tipo_documento: @solicitud.tipo_documento, usu_crea: @solicitud.usu_crea, usu_mod: @solicitud.usu_mod } }
    assert_redirected_to solicitud_url(@solicitud)
  end

  test "should destroy solicitud" do
    assert_difference('Solicitud.count', -1) do
      delete solicitud_url(@solicitud)
    end

    assert_redirected_to solicituds_url
  end
end
