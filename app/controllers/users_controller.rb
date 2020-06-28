class UsersController < ApplicationController
  def home
  end

  def show
    require_login
    @user = current_user
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id

      flash[:message] = "You are logged in as #{@user.name}"
      redirect_to @user
    else
      redirect_to new_user_path
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :happiness, :nausea, :height, :tickets, :admin, :password)
    end
end
