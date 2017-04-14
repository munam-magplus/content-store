require 'test_helper'

class BooksContributorControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get books_contributor_new_url
    assert_response :success
  end

  test "should get create" do
    get books_contributor_create_url
    assert_response :success
  end

end
