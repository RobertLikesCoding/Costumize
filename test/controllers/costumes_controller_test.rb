require "test_helper"

class CostumesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one) # Assuming you have a fixture or factory for users
    sign_in @user
  end

  test "should get home" do
    get root_url
    assert_response :success
  end

  test "should get index" do
    get costumes_path
    assert_response :success
  end

  test "should get show" do
    get costumes_path(@costume)
    assert_response :success
  end

  test "should get new" do
    get new_costume_path
    assert_response :success
  end

  test "should get create" do
    get costumes_path
    assert_response :success
  end
end
