class SessionController < ApplicationController

    def signin

    end

    def create
        user = User.find_by(name: params[:user][:name])
        if user && user.authenticate(params[:user][:password])
            session[:user_id] = user.id
            redirect_to user_path(user)
        else
            render 'signin'
        end

    end

    def delete
        session.clear
        redirect_to root_path
    end

    private

    def user_params
        params.require(:user).permit(:id, :password)
    end

    
end
