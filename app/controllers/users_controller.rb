class UsersController < ApplicationController
    before_action :find_user, only: [:show, :edit, :update, :destroy]

    skip_before_action :current_user, only: [:new, :create]
    skip_before_action :logged_in?, only: [:new, :create]
    skip_before_action :redirect_if_not_logged_in, only: [:new, :create]

    def index 
        @users = User.all
    end
    def show
        # binding.pry
    end



    def new 
        @user = User.new
    end
    def create 
        @user = User.new(user_params)
        
        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            flash[:message] = @user.errors.full_messages.join(", ")
            render :new
        end

    end
    




    def edit

    end
    def update
        # binding.pry
        @user.update(user_params)
        # binding.pry
        redirect_to user_path(@user)
            #YOU CAN ALSO DO THIS: redirect_to @user 

    end


    def destroy
        # binding.pry
        @user.destroy
        flash[:message] = "You've successfully deleted your account!"
        redirect_to users_path

    end





    private 

    def find_user
        @user = User.find_by_id(params[:id])
    end

    def user_params
        #in our params, we wanna require who? (user!), and permit what? (attributes)
        params.require(:user).permit(:username, :email, :password) 

    end

end
