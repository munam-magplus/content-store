require 'test_helper'

class ArticleControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get article_new_url
    assert_response :success
  end

  test "should get index" do
    get article_index_url
    assert_response :success
  end

  test "should get create" do
    get article_create_url
    assert_response :success
  end

  test "should get search" do
    get article_search_url
    assert_response :success
  end

  test "should get result" do
    get article_result_url
    assert_response :success
  end

end
