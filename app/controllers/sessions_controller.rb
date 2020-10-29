class SessionsController < ApplicationController

    def new
        
    end

    def create
        user = User.find_by(email: params[:session][:email])
        if user && user.authentication(params[:session][:password])
            redirect_to index_path
        else
        render 'new'
        end
    end
end