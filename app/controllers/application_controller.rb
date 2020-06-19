class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception
  # skip_before_action :verify_authenticity_token
  helper_method :current_user

  def application
    render 'home'
  end

  def current_user
    User.find(session[:user_id])
  end

end
