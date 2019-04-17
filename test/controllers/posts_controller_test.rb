require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post = posts(:good_post)
    login_with('github')
  end

  test "should get index" do
    get posts_url
    assert_response :success
  end

  test "should get new" do
    get new_post_url
    assert_response :success
  end

  test "should create post" do
    assert_difference('Post.count') do
      post posts_url, params: { post: { content: @post.content, slug: @post.slug, title: @post.title, tag_names: @post.tag_names, photo: fixture_file_upload('files/hank-sq.jpg') } }
    end
    # Cheaply test whether the Author portion of the record is saved via the current_user hash
    # TODO: More directly test whether that's the case
    assert_equal(Post.last.author,authors(:karl))
    assert Post.last.photo.attached?
    assert_redirected_to post_url(Post.last)
  end

  test "should show post" do
    get post_url(@post)
    assert_response :success
  end

  test "should get edit" do
    get edit_post_url(@post)
    assert_response :success
  end

  test "should update post" do
    patch post_url(@post), params: { post: { content: @post.content, slug: @post.slug, title: @post.title, tag_names: @post.tag_names } }
    assert_redirected_to post_url(@post)
  end

  test "should destroy post" do
    assert_difference('Post.count', -1) do
      delete post_url(@post)
    end

    assert_redirected_to posts_url
  end
end
