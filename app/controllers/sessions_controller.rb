class SessionsController < ApplicationController
  skip_before_action :redirect_if_not_logged_in, only: [:welcome, :new, :create]
  skip_before_action :logged_in? 
  def welcome
    @user = User.find_by_id(params[:id])
      if logged_in?
        redirect_to user_path(@user)
      end
  end

  def new # REMEMBER  : NOT TAKING IN AN OBJECT!!
  end

  def create

    @user = User.find_by(username: params[:username])

    # binding.pry

    if  @user && @user.authenticate(params[:password])
          session[:user_id] = @user.id
          # binding.pry  #  Final Check!! 👀
        redirect_to user_path(@user)
    else
        redirect_to login_path        #  redirect_to login_path
    end

  end


  def login
  end

  def destroy
    session.clear
    # redirect_to 'login'
    redirect_to login_path
  end



end
