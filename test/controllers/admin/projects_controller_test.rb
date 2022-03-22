require "test_helper"

class Admin::ProjectsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get admin_projects_show_url
    assert_response :success
  end
end
