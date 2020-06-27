class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user
  before_action :logged_in?

  def current_user
    User.find_by(id: session[:user_id])
  end

  def logged_in?
    if !current_user
      redirect_to '/'
    end
  end

end
