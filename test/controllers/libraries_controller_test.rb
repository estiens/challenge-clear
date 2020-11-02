require 'test_helper'

class LibrariesControllerTest < ActionDispatch::IntegrationTest
  test "should get search" do
    get libraries_search_url
    assert_response :success
  end

  test "should get show" do
    get libraries_show_url
    assert_response :success
  end

end
