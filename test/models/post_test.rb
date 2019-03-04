require 'test_helper'

class PostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "post must have a title" do
    @post = posts(:missing_title)
    refute @post.save
    @post.title = 'OK, You Have a Title'
    assert @post.save
  end
end
