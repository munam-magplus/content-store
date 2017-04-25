require 'test_helper'

class LibraryUsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @library_user = library_users(:one)
  end

  test "should get index" do
    get library_users_url
    assert_response :success
  end

  test "should get new" do
    get new_library_user_url
    assert_response :success
  end

  test "should create library_user" do
    assert_difference('LibraryUser.count') do
      post library_users_url, params: { library_user: { confirm_password: @library_user.confirm_password, country: @library_user.country, email: @library_user.email, first_name: @library_user.first_name, last_name: @library_user.last_name, password: @library_user.password, status: @library_user.status, user_name: @library_user.user_name } }
    end

    assert_redirected_to library_user_url(LibraryUser.last)
  end

  test "should show library_user" do
    get library_user_url(@library_user)
    assert_response :success
  end

  test "should get edit" do
    get edit_library_user_url(@library_user)
    assert_response :success
  end

  test "should update library_user" do
    patch library_user_url(@library_user), params: { library_user: { confirm_password: @library_user.confirm_password, country: @library_user.country, email: @library_user.email, first_name: @library_user.first_name, last_name: @library_user.last_name, password: @library_user.password, status: @library_user.status, user_name: @library_user.user_name } }
    assert_redirected_to library_user_url(@library_user)
  end

  test "should destroy library_user" do
    assert_difference('LibraryUser.count', -1) do
      delete library_user_url(@library_user)
    end

    assert_redirected_to library_users_url
  end
end
