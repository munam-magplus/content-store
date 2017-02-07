require 'test_helper'

class LicenseGroupsControllerTest < ActionDispatch::IntegrationTest
  test "should get search" do
    get license_groups_search_url
    assert_response :success
  end

  test "should get create" do
    get license_groups_create_url
    assert_response :success
  end

  test "should get new" do
    get license_groups_new_url
    assert_response :success
  end

  test "should get index" do
    get license_groups_index_url
    assert_response :success
  end

end
