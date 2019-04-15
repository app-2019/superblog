ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
  setup do
    OmniAuth.config.mock_auth[:github] = nil

    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new({
      provider: 'github',
      uid: authors(:karl).uid,
      info: {
        name: authors(:karl).name,
        nickname: authors(:karl).nickname,
        email: authors(:karl).email
      }
    })
  end

  def sign_in_with(provider)
    post '/auth/github/callback', params: OmniAuth.config.mock_auth[provider]
  end

end
