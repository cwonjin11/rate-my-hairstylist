class SessionsController < ApplicationController
  skip_before_action :redirect_if_not_logged_in, only: [:omniauth, :welcome, :new, :create]
  skip_before_action :logged_in? 
  
  
  def omniauth
    user = User.find_or_create_by(uid: auth['uid'], provider: auth['provider']) do |u|
      u.username = auth['info']['first_name']
      u.email = auth['info']['email']
      u.password = SecureRandom.hex(16)
    end
    if user.valid?
      session[:user_id] = user.id
       redirect_to pages_path
    else
      flash[:message] = user.errors.full_messages.join(", ")
      redirect_to root_path
    end
  end
  
  
  
  
  def welcome
    @user = User.find_by_id(params[:id])
      if logged_in?
        redirect_to pages_path
      end
  end


  def new
    if logged_in?
      flash[:message] = "You are already logged in!"
      redirect_to root_path
    end
  end

  
  def create

    @user = User.find_by(username: params[:username])
    if  @user && @user.authenticate(params[:password])
          session[:user_id] = @user.id
        redirect_to pages_path
    else
        @errors = "Please check your username and password."   
        render :new 

    end

  end


  def login
    
  end

  def destroy #log out
    session.clear
    flash[:message] = "👋🏻 #{@user.username.upcase}, You've logged out. See You Again! 👋🏻"
    redirect_to root_path
  end



  private
  def auth
    request.env['omniauth.auth']
  end

end
