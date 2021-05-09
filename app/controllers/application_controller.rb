class ApplicationController < ActionController::Base
    
    helper_method :logged_in?, :current_user
    #any method we want access through out entire application

    def current_user
        @user = User.find_by_id(session[:user_id]) 
        #or 
        # @user ||= User.find_by_id(session[:user_id]) 
        # if the user is @user ||= (or, if there's no user set user as) User.find_by_id(session[:user_id])
    end


    def logged_in?
        !current_user.nil? #.nil means "is this nil?"
        #  current_user != nil
        
        ##    !    <<<<{Will Be Negated}<<<<    (  (current_user.nil?) = TRUE  )

    end 


end
