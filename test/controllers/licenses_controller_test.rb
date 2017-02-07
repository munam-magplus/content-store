require 'test_helper'

class LicensesControllerTest < ActionDispatch::IntegrationTest
  test "should get search" do
    get licenses_search_url
    assert_response :success
  end

  test "should get create" do
    get licenses_create_url
    assert_response :success
  end

  test "should get new" do
    get licenses_new_url
    assert_response :success
  end

  test "should get index" do
    get licenses_index_url
    assert_response :success
  end

end
