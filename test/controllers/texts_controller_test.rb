require 'test_helper'

class TextsControllerTest < ActionController::TestCase
  test "should get send_text" do
    get :send_text
    assert_response :success
  end

end
