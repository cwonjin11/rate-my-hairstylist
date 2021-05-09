class UsersController < ApplicationController
    before_action :find_user, only: [:show, :edit, :update, :destroy]

    def index 
        @users = User.all
    end

    def show

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
