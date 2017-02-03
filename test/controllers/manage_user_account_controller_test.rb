require 'test_helper'

class ManageUserAccountControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get manage_user_account_index_url
    assert_response :success
  end

end
