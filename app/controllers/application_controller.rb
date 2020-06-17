class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user
  helper_method :logged_in 
  helper_method :set_user

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in
    !!session[:user_id]
  end

  def set_user
    @user = current_user
  end
 
  private
 
  def require_login
    unless logged_in
      flash[:error] = "You must be logged in to access this section"
      redirect_to root_path # halts request cycle
    end
  end

end
