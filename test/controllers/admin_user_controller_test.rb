require 'test_helper'

class AdminUserControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admin_user_new_url
    assert_response :success
  end

  test "should get create" do
    get admin_user_create_url
    assert_response :success
  end

  test "should get search" do
    get admin_user_search_url
    assert_response :success
  end

end
