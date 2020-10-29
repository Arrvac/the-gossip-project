class SessionsController < ApplicationController

    def new
        
    end

    def destroy
        session.delete(:user_id)
        logout
        redirect_to index_path
    end
    
    def create
        user = User.find_by(email: params[:session][:email])
        if user && user.authenticate(params[:session][:password])
            session[:user_id] = user.id
            redirect_to index_path
        else
            render 'new'
        end
    end
end