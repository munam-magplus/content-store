require 'test_helper'

class CdpUsersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get cdp_users_new_url
    assert_response :success
  end

end
