require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get designers" do
    get :designers
    assert_response :success
  end

  test "should get services" do
    get :services
    assert_response :success
  end

  test "should get designs" do
    get :designs
    assert_response :success
  end

end
