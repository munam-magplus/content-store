require 'test_helper'

class InstitutionControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get institution_index_url
    assert_response :success
  end

  test "should get show" do
    get institution_show_url
    assert_response :success
  end

  test "should get new" do
    get institution_new_url
    assert_response :success
  end

  test "should get create" do
    get institution_create_url
    assert_response :success
  end

  test "should get search" do
    get institution_search_url
    assert_response :success
  end

end
