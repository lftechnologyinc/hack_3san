require 'test_helper'

class TwilioControllerControllerTest < ActionController::TestCase
  test "should get process_sms" do
    get :process_sms
    assert_response :success
  end

end
