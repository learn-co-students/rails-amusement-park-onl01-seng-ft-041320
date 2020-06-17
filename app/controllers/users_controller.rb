class UsersController < ApplicationController
    before_action :require_login, only: [:show, :edit, :update, :destroy]
    before_action :set_user, only: [:show, :edit, :update, :destroy]

    def index
    end

    def show
        @message = flash[:alert]
    end
    
    def new
        @user = User.new
    end

    def create
        @user = User.create(user_params(:name, :height, :happiness, :nausea, :password, :tickets, :admin))
        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            render 'new'
        end
    end

    def edit
    end
    
    def update
    end

    def destroy
    end

    private

    def user_params(*args)
        params.require(:user).permit(*args)
    end

end