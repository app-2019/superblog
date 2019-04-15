require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest

  test "should get create" do
    post '/auth/github/callback', params: OmniAuth.config.mock_auth[:github]
    assert_redirected_to posts_url
  end

end
