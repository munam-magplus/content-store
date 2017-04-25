require 'test_helper'

class LibraryUsersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get library_users_index_url
    assert_response :success
  end

  test "should get new" do
    get library_users_new_url
    assert_response :success
  end

  test "should get create" do
    get library_users_create_url
    assert_response :success
  end

  test "should get search" do
    get library_users_search_url
    assert_response :success
  end

  test "should get edit" do
    get library_users_edit_url
    assert_response :success
  end

  test "should get update" do
    get library_users_update_url
    assert_response :success
  end

end
