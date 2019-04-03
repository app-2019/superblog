class SessionsController < ApplicationController
  protect_from_forgery except: :create
  def create
    @provider_hash = request.env['omniauth.auth'].to_json
  end
end
