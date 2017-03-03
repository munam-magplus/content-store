require 'test_helper'

class SiteSettings::SiteSettingControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get site_settings_site_setting_index_url
    assert_response :success
  end

end
