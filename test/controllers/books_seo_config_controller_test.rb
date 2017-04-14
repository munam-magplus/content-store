require 'test_helper'

class BooksSeoConfigControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get books_seo_config_new_url
    assert_response :success
  end

  test "should get create" do
    get books_seo_config_create_url
    assert_response :success
  end

end
