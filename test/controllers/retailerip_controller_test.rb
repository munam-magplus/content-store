require 'test_helper'

class RetaileripControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get retailerip_new_url
    assert_response :success
  end

  test "should get create" do
    get retailerip_create_url
    assert_response :success
  end

end
