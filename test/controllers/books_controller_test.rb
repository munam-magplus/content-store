require 'test_helper'

class BooksControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get books_create_url
    assert_response :success
  end

  test "should get search" do
    get books_search_url
    assert_response :success
  end

end
