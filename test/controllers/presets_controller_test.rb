require 'test_helper'

class PresetsControllerTest < ActionDispatch::IntegrationTest
  test "should get display" do
    get presets_display_url
    assert_response :success
  end

end
