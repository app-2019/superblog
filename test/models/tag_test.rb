require 'test_helper'

class TagTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "access posts through tags" do
    assert_equal tags(:general).posts.count, 2
  end

end
