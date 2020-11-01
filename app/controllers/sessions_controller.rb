class SessionsController < ApplicationController

    def new
        
    end

    def destroy
        session.delete(:user_id)
        logout
        redirect_to index_path
    end
    
    def create
        user = User.find_by(email: params[:session][:email].downcase)
        if user && user.authenticate(params[:session][:password])
            reset_session
            remember user
            session[:user_id] = user.id
            redirect_to index_path
        else
            flash.now[:danger] = 'Invalid email/password combination'
            render 'new'
        end
    end
end