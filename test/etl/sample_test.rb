require 'test_helper'
require 'etl/sample'

class SampleTest < ActiveSupport::TestCase
  test "Sample#example should return greeting" do
    s = Sample.new
    assert_equal "Hello world", s.example
  end
end