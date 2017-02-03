require 'test_helper'

class PrinthouseSetupControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get printhouse_setup_index_url
    assert_response :success
  end

end
