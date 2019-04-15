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
    get sessions_create_url
    assert_response :success
  end

end
