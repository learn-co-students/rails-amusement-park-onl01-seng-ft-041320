class SessionsController < ApplicationController
    
    def new
    end

    def create
        #I know this is weird but I set it up expecting them to use user_id, and they(whoever wrote the tests) wanted name. Even though I'm making a user select a unique name /I/ still think the id is the best bet because it can absolutely only correspond to 1 row in the db. :shrugs:
        @user = User.find_by(id: params[:user_name])

        if @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            render 'new'
        end
    end

    def destroy
        session.delete :user_id
        redirect_to root_path
    end
    
end