require "test_helper"

class UserTest < ActiveSupport::TestCase
  def setup
    @user = create(:user)
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "password be present" do
    @user.password = ""
    assert_not @user.valid?
  end

  test "email be has valid format" do
    @user.email = "test.com"
    assert_not @user.valid?
  end

  test "user has at least one role" do
    assert @user.has_role?(:admin)
  end
  
  test "email must have vaild present" do
    @user.email = " "
    assert_not @user.valid?
  end


end
