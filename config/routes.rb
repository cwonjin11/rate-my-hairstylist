Rails.application.routes.draw do
  # get 'stylists/index'
  # get 'stylists/show'
  # get 'stylists/new'
  # get 'stylists/create'
  # get 'stylists/edit'
  # get 'stylists/update'
  # get 'stylists/destroy'
  # get 'sessions/new'
  # get 'sessions/create'
  # get 'sessions/login'
  # get 'sessions/destroy'
# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

####### OmniAuth #########

# get '/auth/google_oauth2/callback', to: 'sessions#omniauth'
get '/auth/:provider/callback', to: 'sessions#omniauth'


########   SESSIONS ROUTES  ### SIGN UP IS IN USER ROUTES ALREADY!! 

get 'login', to: "sessions#new"

post 'login', to: "sessions#create"

delete 'logout', to: "sessions#destroy"


# 🚧 # THINGS WE HAVE TO BUILD OUT

get 'welcome', to: "sessions#welcome" 

# 🚧 #

######## 
# REMEMBER FOLKS  ::  NO resource :sessions 



  resources :users do

    resources :user_stylists
    # resources :stylists
  end

  resources :user_stylists
  resources :stylists





end
