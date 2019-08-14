require 'test_helper'

class UserCoursesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get user_courses_create_url
    assert_response :success
  end

end
