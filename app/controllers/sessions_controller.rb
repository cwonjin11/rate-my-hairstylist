class SessionsController < ApplicationController
  skip_before_action :redirect_if_not_logged_in, only: [:omniauth, :welcome, :new, :create]
  skip_before_action :logged_in? 
  
  
  def omniauth
    # binding.pry
    #these two pieces of information are going to be recorded soley for the purpose of finding that user again
    user = User.find_or_create_by(uid: auth['uid'], provider: auth['provider']) do |u|
      u.username = auth['info']['first_name']
      u.email = auth['info']['email']
      u.password = SecureRandom.hex(16)
    end
    if user.valid?
      session[:user_id] = user.id
       redirect_to user_path(user)
    else
      flash[:message] = user.errors.full_messages.join(", ")
      redirect_to welcome_path
    end
  end
  
  
  
  
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
        @errors = "Please check your username and password."
        # flash[:message] = user.errors.full_messages.join(", ")
        # redirect_to login_path    
        render :new #  redirect_to login_path
    end

  end


  def login
    
  end

  def destroy #log out
    session.clear
    # redirect_to 'login'
    flash[:message] = "👋🏻 #{@user.username.upcase}, You've logged out. See You Again! 👋🏻"
    redirect_to root_path
  end



  private
  def auth
    request.env['omniauth.auth']
  end

end
