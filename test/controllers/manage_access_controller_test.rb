require 'test_helper'

class ManageAccessControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get manage_access_index_url
    assert_response :success
  end

end
