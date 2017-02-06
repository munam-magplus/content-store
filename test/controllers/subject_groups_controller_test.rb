require 'test_helper'

class SubjectGroupsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get subject_groups_create_url
    assert_response :success
  end

  test "should get search" do
    get subject_groups_search_url
    assert_response :success
  end

  test "should get metadata_sheet" do
    get subject_groups_metadata_sheet_url
    assert_response :success
  end

end
