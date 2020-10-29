module SessionsHelper
    def current_user
        User.find_by(id: session[:user_id])
    end

    def logout
        reset_session
        session[:user_id] = nil
    end
end
