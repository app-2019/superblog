require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest

  setup do
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new({
      uid: authors(:karl).uid,
      info: {
        name: authors(:karl).name,
        nickname: authors(:karl).nickname,
        email: authors(:karl).email
      }
    })
  end

  test "should get create" do
    post '/auth/github/callback', params: OmniAuth.config.mock_auth[:github]
    assert_redirected_to posts_url
  end

end
