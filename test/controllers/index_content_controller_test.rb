require 'test_helper'

class IndexContentControllerTest < ActionDispatch::IntegrationTest
  test "should get content_code:integer" do
    get index_content_content_code:integer_url
    assert_response :success
  end

  test "should get publisher_code:string" do
    get index_content_publisher_code:string_url
    assert_response :success
  end

end
