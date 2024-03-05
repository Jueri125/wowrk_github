require "test_helper"

class Public::CustomersControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get public_customers_create_url
    assert_response :success
  end
end
