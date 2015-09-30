require 'test_helper'

class ExamplesControllerTest < ActionController::TestCase
  test "should get simple_form" do
    get :simple_form
    assert_response :success
  end

end
