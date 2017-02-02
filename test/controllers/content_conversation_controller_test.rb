require 'test_helper'

class ContentConversationControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get content_conversation_index_url
    assert_response :success
  end

end
