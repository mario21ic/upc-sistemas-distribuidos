require 'test_helper'

class SepararControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get separar_index_url
    assert_response :success
  end

  test "should get new" do
    get separar_new_url
    assert_response :success
  end

end
