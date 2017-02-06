require 'test_helper'

class AppsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get apps_index_url
    assert_response :success
  end

  test "should get edit" do
    get apps_edit_url
    assert_response :success
  end

  test "should get new" do
    get apps_new_url
    assert_response :success
  end

end
