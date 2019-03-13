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

  test "post responds to author_name getter" do
    @post = posts(:good_post)
    assert_equal @post.author_name, posts(:good_post).author.name
  end

  test "post responses to author_name setter" do
    @post = posts(:good_post)
    @post.author_name = authors(:hank).name
    @post.save
    assert_equal @post.author_name, authors(:hank).name
  end

  test "access tags through post" do
    assert_equal posts(:good_post).tags.count, 2
    assert_equal posts(:good_post).tags.first.name, tags(:general).name
    assert posts(:good_post).tags.include? tags(:fyi)
  end

end
