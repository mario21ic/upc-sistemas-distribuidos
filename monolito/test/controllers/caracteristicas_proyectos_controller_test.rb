require 'test_helper'

class CaracteristicasProyectosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @caracteristicas_proyecto = caracteristicas_proyectos(:one)
  end

  test "should get index" do
    get caracteristicas_proyectos_url
    assert_response :success
  end

  test "should get new" do
    get new_caracteristicas_proyecto_url
    assert_response :success
  end

  test "should create caracteristicas_proyecto" do
    assert_difference('CaracteristicasProyecto.count') do
      post caracteristicas_proyectos_url, params: { caracteristicas_proyecto: { cod_caracteristica: @caracteristicas_proyecto.cod_caracteristica, cod_proyecto: @caracteristicas_proyecto.cod_proyecto, estado: @caracteristicas_proyecto.estado, fec_crea: @caracteristicas_proyecto.fec_crea, fec_mod: @caracteristicas_proyecto.fec_mod, usu_crea: @caracteristicas_proyecto.usu_crea, usu_mod: @caracteristicas_proyecto.usu_mod } }
    end

    assert_redirected_to caracteristicas_proyecto_url(CaracteristicasProyecto.last)
  end

  test "should show caracteristicas_proyecto" do
    get caracteristicas_proyecto_url(@caracteristicas_proyecto)
    assert_response :success
  end

  test "should get edit" do
    get edit_caracteristicas_proyecto_url(@caracteristicas_proyecto)
    assert_response :success
  end

  test "should update caracteristicas_proyecto" do
    patch caracteristicas_proyecto_url(@caracteristicas_proyecto), params: { caracteristicas_proyecto: { cod_caracteristica: @caracteristicas_proyecto.cod_caracteristica, cod_proyecto: @caracteristicas_proyecto.cod_proyecto, estado: @caracteristicas_proyecto.estado, fec_crea: @caracteristicas_proyecto.fec_crea, fec_mod: @caracteristicas_proyecto.fec_mod, usu_crea: @caracteristicas_proyecto.usu_crea, usu_mod: @caracteristicas_proyecto.usu_mod } }
    assert_redirected_to caracteristicas_proyecto_url(@caracteristicas_proyecto)
  end

  test "should destroy caracteristicas_proyecto" do
    assert_difference('CaracteristicasProyecto.count', -1) do
      delete caracteristicas_proyecto_url(@caracteristicas_proyecto)
    end

    assert_redirected_to caracteristicas_proyectos_url
  end
end
