require 'test_helper'

class TextToSpeechControllerTest < ActionDispatch::IntegrationTest
  test "should get say" do
    get text_to_speech_say_url
    assert_response :success
  end

end
