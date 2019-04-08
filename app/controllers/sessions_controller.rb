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
  end
  def login
  end
  def logout
  end
end
