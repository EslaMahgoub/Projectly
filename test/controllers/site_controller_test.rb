require "test_helper"

class SiteControllerTest < ActionDispatch::IntegrationTest
  test "should get home page" do
    get root_path
    assert_response :success
  end
end
