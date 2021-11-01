require "test_helper"

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: "Test User", encrypted_password: "password123")
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "email be present" do
    @user.email = " "
    assert_not @user.valid?
  end
end
