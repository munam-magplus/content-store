require 'test_helper'

class AccessTokensControllerTest < ActionDispatch::IntegrationTest
  test "should get search" do
    get access_tokens_search_url
    assert_response :success
  end

  test "should get create" do
    get access_tokens_create_url
    assert_response :success
  end

  test "should get new" do
    get access_tokens_new_url
    assert_response :success
  end

  test "should get index" do
    get access_tokens_index_url
    assert_response :success
  end

end
