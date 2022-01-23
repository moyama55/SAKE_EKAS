require 'test_helper'

class AlchoolsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get alchools_new_url
    assert_response :success
  end

end
