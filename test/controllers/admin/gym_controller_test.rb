require "test_helper"

class Admin::GymControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admin_gym_new_url
    assert_response :success
  end

  test "should get index" do
    get admin_gym_index_url
    assert_response :success
  end

  test "should get edit" do
    get admin_gym_edit_url
    assert_response :success
  end
end
