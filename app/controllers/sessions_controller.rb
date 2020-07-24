class SessionsController < ApplicationController
    skip_before_action :logged_in?, only: [:new, :create]

    def new
        @user = User.new
    end

    def create
      
      if params[:provider] == 'github'
        @user = User.create_by_github_omniauth(auth)
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      else
      
        @user = User.find_by(name: params[:user][:name])
        return redirect_to(controller: 'sessions', action: 'new') unless @user.authenticate(params[:user][:password])
        flash[:error] = "Incorrect Login info. Try again."
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      end
    end

    def destroy
        session.delete :user_id
        redirect_to '/'
    end
    
    def omniauth
      @user = User.create_by_github_omniauth(auth)
  
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    end
    
    private
 
    def auth
      request.env['omniauth.auth']
    end

end