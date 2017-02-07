require 'test_helper'

class SubscriptionsControllerTest < ActionDispatch::IntegrationTest
  test "should get search" do
    get subscriptions_search_url
    assert_response :success
  end

  test "should get create" do
    get subscriptions_create_url
    assert_response :success
  end

  test "should get new" do
    get subscriptions_new_url
    assert_response :success
  end

  test "should get index" do
    get subscriptions_index_url
    assert_response :success
  end

end
