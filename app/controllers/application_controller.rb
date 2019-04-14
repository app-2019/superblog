class ApplicationController < ActionController::Base

  helper_method :current_user

  private
  # Getter method for current user
  def current_user
    @current_user ||= Author.find_by(uid: session[:uid])
  end
  # Setter method for current user
  def current_user=(author)
    session[:uid] = author.uid
    session[:name] = author.name
  end

  def user_signed_in?
    !!current_user
  end

  def authenticate_user
    unless user_signed_in?
      redirect_to github_auth_url(origin: request.url)
    end
  end

end
