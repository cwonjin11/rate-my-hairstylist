class ApplicationController < ActionController::Base
    before_action :current_user, :logged_in?, :redirect_if_not_logged_in
    helper_method :logged_in?, :current_user

    def current_user
        @user = User.find_by_id(session[:user_id]) 

    end



    def logged_in?
        !current_user.nil? 
    end 



    def redirect_if_not_logged_in
        if !logged_in?
            flash[:message] = "Please log in !!"
           redirect_to root_path
        end
    end


end
