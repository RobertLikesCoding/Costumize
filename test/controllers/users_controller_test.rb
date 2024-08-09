require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one) # Assuming you have a fixture or factory for users
    sign_in @user
  end
  
  test "should get index" do
    get users_index_path
    assert_response :success
  end
end
