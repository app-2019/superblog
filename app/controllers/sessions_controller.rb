class SessionsController < ApplicationController
  protect_from_forgery except: :create
  def create
    # @provider_hash = request.env['omniauth.auth'].to_json
    omni = request.env['omniauth.auth']
    @author = Author.find_or_create_by(uid: omni['uid']) do |author|
      author.name = omni['info']['name']
      author.nickname = omni['info']['nickname']
      author.email = omni['info']['email']
    end
    self.current_user = @author
    # Hacky, but enables tests to pass; assign `/posts` to origin when `omniauth.origin` is missing
    origin = request.env['omniauth.origin'] || '/posts'
    redirect_to origin.include?('log') ? posts_url : origin
  end
  def login
  end
  def logout
    reset_session
    redirect_to login_url, notice: "You have been logged out."
  end
end
