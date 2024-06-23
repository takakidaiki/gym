require "test_helper"

class FitnessGymsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get fitness_gyms_index_url
    assert_response :success
  end

  test "should get show" do
    get fitness_gyms_show_url
    assert_response :success
  end
end
