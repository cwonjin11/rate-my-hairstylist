class UsersController < ApplicationController
    before_action :find_user, only: [:show, :edit, :update, :destroy]

    skip_before_action :current_user, only: [:new, :create]  #sign up : no object
    skip_before_action :logged_in?, only: [:new, :create]
    skip_before_action :redirect_if_not_logged_in, only: [:new, :create]

    # def index 
    #     @users = User.all
    # end
    def show
        prevent_user
    end



    def new 
        if logged_in?
            flash[:message] = "You are already logged in!"
            redirect_to pages_path
        else
            @user = User.new
        end
    end

    def create 
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to pages_path
        else

            render :new
        end

    end





    def edit
        prevent_user
    end 

    def update
        if @user.update(user_params)
        flash[:message] = "Succesfully Updated"
        redirect_to user_path(@user)
        else
        render :edit
        end

    end


    def destroy
        @user.destroy
        flash[:message] = "You've successfully deleted your account!"
        redirect_to root_path

    end





    private 

    def find_user
        @user = User.find_by_id(params[:id])
    end

    def user_params
        params.require(:user).permit(:username, :email, :password) 

    end

    def prevent_user
        if current_user.id != params[:id].to_i
            flash[:message] = " Something went wrong here. Please try again! "
            redirect_to root_path
        end
    end

end
