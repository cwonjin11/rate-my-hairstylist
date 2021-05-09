class SessionsController < ApplicationController
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
