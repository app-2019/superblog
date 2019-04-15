require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest

  test "authorization should create a new author" do
    # post '/auth/github/callback', params: { uid: '123456' }
    assert_difference('Author.count') do
      post '/auth/github/callback', params: OmniAuth.config.add_mock(:github, {uid: 112233})
    end
  end

end
