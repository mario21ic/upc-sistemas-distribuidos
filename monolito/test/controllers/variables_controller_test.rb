require 'test_helper'

class VariablesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @variable = variables(:one)
  end

  test "should get index" do
    get variables_url
    assert_response :success
  end

  test "should get new" do
    get new_variable_url
    assert_response :success
  end

  test "should create variable" do
    assert_difference('Variable.count') do
      post variables_url, params: { variable: { codigo_variable: @variable.codigo_variable, dato_extra: @variable.dato_extra, dato_extra2: @variable.dato_extra2, dato_extra3: @variable.dato_extra3, descricion_variable: @variable.descricion_variable, estado: @variable.estado, fec_crea: @variable.fec_crea, fec_mod: @variable.fec_mod, tipo_variable: @variable.tipo_variable, usu_crea: @variable.usu_crea, usu_mod: @variable.usu_mod } }
    end

    assert_redirected_to variable_url(Variable.last)
  end

  test "should show variable" do
    get variable_url(@variable)
    assert_response :success
  end

  test "should get edit" do
    get edit_variable_url(@variable)
    assert_response :success
  end

  test "should update variable" do
    patch variable_url(@variable), params: { variable: { codigo_variable: @variable.codigo_variable, dato_extra: @variable.dato_extra, dato_extra2: @variable.dato_extra2, dato_extra3: @variable.dato_extra3, descricion_variable: @variable.descricion_variable, estado: @variable.estado, fec_crea: @variable.fec_crea, fec_mod: @variable.fec_mod, tipo_variable: @variable.tipo_variable, usu_crea: @variable.usu_crea, usu_mod: @variable.usu_mod } }
    assert_redirected_to variable_url(@variable)
  end

  test "should destroy variable" do
    assert_difference('Variable.count', -1) do
      delete variable_url(@variable)
    end

    assert_redirected_to variables_url
  end
end
