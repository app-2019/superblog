require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest

  setup do
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new({
      provider: 'github',
      uid: '123456',
      info: {
        name: 'karlstolley',
        nickname: 'Karl Stolley',
        email: 'karl@example.com'
      }
    })
  end

  test "authorization should create a new author" do
    # post '/auth/github/callback', params: { uid: '123456' }
    assert_difference('Author.count') do
      post '/auth/github/callback', params: OmniAuth.config.mock_auth[:github]
    end
  end

end
