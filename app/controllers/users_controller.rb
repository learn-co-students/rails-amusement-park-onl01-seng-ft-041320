class UsersController < ApplicationController
    skip_before_action :logged_in?, only: [:new, :create], :raise => false

    def new
        @user = User.new
    end

    def create
        @user = User.create(user_params)
        return redirect_to controller: 'users', action: 'new' unless @user.save
        session[:user_id] = @user.id
        redirect_to user_path(@user)
    end

    def show
        @user = User.find_by(id: params[:id])
    end

private

    def user_params
    params.require(:user).permit(
      :name,
      :height,
      :nausea,
      :tickets,
      :admin,
      :password,
      :happiness
    )
    end

end
