require 'test_helper'

class JournalsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get journals_new_url
    assert_response :success
  end

  test "should get search" do
    get journals_search_url
    assert_response :success
  end

  test "should get upload_article_metadata" do
    get journals_upload_article_metadata_url
    assert_response :success
  end

  test "should get search_article" do
    get journals_search_article_url
    assert_response :success
  end

  test "should get new_article" do
    get journals_new_article_url
    assert_response :success
  end

end
