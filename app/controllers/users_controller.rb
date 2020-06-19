class UsersController < ApplicationController


    def index
        
    end

    def new
        @user = User.new
    end
    
    def create
        @user = User.new(user_params)
        if @user.save
          flash[:success] = "User successfully created"
          session[:user_id] = @user.id
          redirect_to user_path(@user)
        else
          flash[:error] = "Something went wrong"
          render 'new'
        end
    end

    def show
      if is_logged_in
        @user = User.find(params[:id])
        render 'profile'
      else
        redirect_to root_path
      end
    end
    

    private

    def user_params
      params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :admin, :password)
    end
    
    def current_user
      User.find(session[:user_id])
    end

    def is_logged_in
      session[:user_id] ? true : false
    end

end