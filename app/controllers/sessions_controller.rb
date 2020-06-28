class SessionsController < ApplicationController

  def new
    @user = User.new
    render 'signin'
  end

  def create
    @user = User.find_by(name: params[:user][:name])
    authenticated = @user.try(:authenticate, params[:user][:password])
    if @user
      session[:user_id] = @user.id

      redirect_to @user
    else
      redirect_to new_user_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:message] = "You are logged out"

    redirect_to root_path
  end
end
