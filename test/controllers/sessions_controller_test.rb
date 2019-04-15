require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest

  test "should redirect to posts URL on login" do
    post '/auth/github/callback', params: OmniAuth.config.mock_auth[:github]
    assert_redirected_to posts_url
  end

  test "first-time login should create a new Author record" do
    assert_difference('Author.count') do
      # post '/auth/github/callback', params: OmniAuth.config.mock_auth[:github]
      post '/auth/github/callback', params: OmniAuth.config.add_mock(:github, {uid: '22222'})

      # TODO: Figure out why in this context it's okay to access `session`:
      assert_equal(session[:uid],'22222')
    end
  end

  test "user should be able to logout" do
    get logout_url
    assert_nil(session[:uid])
  end
end
