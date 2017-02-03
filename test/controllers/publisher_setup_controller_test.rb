require 'test_helper'

class PublisherSetupControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get publisher_setup_index_url
    assert_response :success
  end

end
