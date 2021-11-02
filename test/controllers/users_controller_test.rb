require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers 
  def setup
    @admin_user = build(:user)
  end
  
  test "should get index" do
    sign_in @admin_user
    get users_path
    assert_response :success
  end

  test "should get edit" do
    sign_in @admin_user
    get edit_user_path(@admin_user.id)
    assert_response :success
  end
end
