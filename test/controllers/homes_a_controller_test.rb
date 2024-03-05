require "test_helper"

class HomesAControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get homes_a_top_url
    assert_response :success
  end
end
