require "test_helper"

class ErrorControllerTest < ActionDispatch::IntegrationTest
  test "should get not_found" do
    get error_not_found_url
    assert_response :success
  end
end
