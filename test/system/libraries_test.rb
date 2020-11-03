require "application_system_test_case"

class LibrariesTest < ApplicationSystemTestCase
  # If you want to see the test in action, simple comment the following line.
  driven_by :selenium, using: :headless_chrome

  test "visiting the index" do
    visit libraries_search_url
    assert_selector "h1", text: "Libraries"
  end
end
