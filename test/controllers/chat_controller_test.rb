require 'test_helper'

class ChatControllerTest < ActionDispatch::IntegrationTest
  test "should get intro" do
    get chat_intro_url
    assert_response :success
  end

  test "should get room" do
    get chat_room_url
    assert_response :success
  end

end
