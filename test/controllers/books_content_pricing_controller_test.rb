require 'test_helper'

class BooksContentPricingControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get books_content_pricing_new_url
    assert_response :success
  end

  test "should get create" do
    get books_content_pricing_create_url
    assert_response :success
  end

end
