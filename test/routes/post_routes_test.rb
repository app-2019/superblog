require 'test_helper'

class PostsRoutesTest < ActionDispatch::IntegrationTest
  setup do
    @post = posts(:one)
  end

  test "id parameter should only be digits" do
    get "/posts/#{@post.id}"
    assert_response :success
    assert_raise ActionController::RoutingError do
      get "/posts/abc123"
    end
  end
end
