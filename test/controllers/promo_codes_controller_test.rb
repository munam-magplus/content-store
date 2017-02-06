require 'test_helper'

class PromoCodesControllerTest < ActionDispatch::IntegrationTest
  test "should get search" do
    get promo_codes_search_url
    assert_response :success
  end

  test "should get create" do
    get promo_codes_create_url
    assert_response :success
  end

  test "should get new" do
    get promo_codes_new_url
    assert_response :success
  end

  test "should get index" do
    get promo_codes_index_url
    assert_response :success
  end

end
