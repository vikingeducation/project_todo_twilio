require 'test_helper'

class TextsControllerTest < ActionDispatch::IntegrationTest
  test "should get send_text" do
    get texts_send_text_url
    assert_response :success
  end

end
