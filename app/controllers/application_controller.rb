class ApplicationController < ActionController::Base
    # before_action :current_user, :redirect_if_not_logged_in
    before_action :current_user, :logged_in?, :redirect_if_not_logged_in
    helper_method :logged_in?, :current_user
    #any method we want access through out entire application

    def current_user
        @user = User.find_by_id(session[:user_id]) 
        #or 
        # @user ||= User.find_by_id(session[:user_id]) 
        # if the user is @user ||= (or, if there's no user set user as) User.find_by_id(session[:user_id])
    end


    # def current_user
    #     @current_user ||= User.find(session[:user_id]) if session[:user_id]
    # end
    #     helper_method :current_user


    def logged_in?
        !current_user.nil? #.nil means "is this nil?"
        #  current_user != nil
        
        ##    !    <<<<{Will Be Negated}<<<<    (  (current_user.nil?) = TRUE  )
    end 

    def redirect_if_not_logged_in
        if !logged_in?
          redirect_to welcome_path
        end
    end



end
