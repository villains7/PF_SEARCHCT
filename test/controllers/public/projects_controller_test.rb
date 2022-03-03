require "test_helper"

class Public::ProjectsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get public_projects_new_url
    assert_response :success
  end

  test "should get create" do
    get public_projects_create_url
    assert_response :success
  end

  test "should get index" do
    get public_projects_index_url
    assert_response :success
  end

  test "should get show" do
    get public_projects_show_url
    assert_response :success
  end
end
