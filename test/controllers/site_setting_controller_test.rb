require 'test_helper'

class SiteSettingControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get site_setting_new_url
    assert_response :success
  end

  test "should get create" do
    get site_setting_create_url
    assert_response :success
  end

  test "should get index" do
    get site_setting_index_url
    assert_response :success
  end

  test "should get delete" do
    get site_setting_delete_url
    assert_response :success
  end

end
