require 'test_helper'

class EndUserControllerTest < ActionDispatch::IntegrationTest
  test "should get search" do
    get end_user_search_url
    assert_response :success
  end

  test "should get new" do
    get end_user_new_url
    assert_response :success
  end

  test "should get create" do
    get end_user_create_url
    assert_response :success
  end

end
