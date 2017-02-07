require 'test_helper'

class InstitutionUserControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get institution_user_index_url
    assert_response :success
  end

  test "should get show" do
    get institution_user_show_url
    assert_response :success
  end

  test "should get new" do
    get institution_user_new_url
    assert_response :success
  end

  test "should get create" do
    get institution_user_create_url
    assert_response :success
  end

  test "should get search" do
    get institution_user_search_url
    assert_response :success
  end

end
