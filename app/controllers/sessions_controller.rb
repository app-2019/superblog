class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]
  def create
    auth_hash = request.env['omniauth.auth']
    @author = Author.find_or_create_by(uid: auth_hash['uid']) do | author|
      author.login = auth_hash['info']['nickname']
      author.name = auth_hash['info']['name']
      author.email = auth_hash['info']['email']
    end
  end
end
