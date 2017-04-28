require 'test_helper'

class ContactUsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @contact_u = contact_us(:one)
  end

  test "should get index" do
    get contact_us_url
    assert_response :success
  end

  test "should get new" do
    get new_contact_u_url
    assert_response :success
  end

  test "should create contact_u" do
    assert_difference('ContactU.count') do
      post contact_us_url, params: { contact_u: { comments: @contact_u.comments, fax_number: @contact_u.fax_number, phone_number: @contact_u.phone_number, subject: @contact_u.subject, topic: @contact_u.topic } }
    end

    assert_redirected_to contact_u_url(ContactU.last)
  end

  test "should show contact_u" do
    get contact_u_url(@contact_u)
    assert_response :success
  end

  test "should get edit" do
    get edit_contact_u_url(@contact_u)
    assert_response :success
  end

  test "should update contact_u" do
    patch contact_u_url(@contact_u), params: { contact_u: { comments: @contact_u.comments, fax_number: @contact_u.fax_number, phone_number: @contact_u.phone_number, subject: @contact_u.subject, topic: @contact_u.topic } }
    assert_redirected_to contact_u_url(@contact_u)
  end

  test "should destroy contact_u" do
    assert_difference('ContactU.count', -1) do
      delete contact_u_url(@contact_u)
    end

    assert_redirected_to contact_us_url
  end
end
