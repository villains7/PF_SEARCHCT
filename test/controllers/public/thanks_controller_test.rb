require "test_helper"

class Public::ThanksControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get public_thanks_create_url
    assert_response :success
  end

  test "should get destroy" do
    get public_thanks_destroy_url
    assert_response :success
  end
end
