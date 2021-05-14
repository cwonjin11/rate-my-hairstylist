Rails.application.routes.draw do


root "sessions#welcome"
####### OmniAuth #################   google ########
# get '/auth/google_oauth2/callback', to: 'sessions#omniauth'
get '/auth/:provider/callback', to: 'sessions#omniauth'  #<= makes more dynamic
#################################################################


# 🚧 # THINGS WE HAVE TO BUILD OUT
# get 'welcome', to: "sessions#welcome" 
# 🚧 #
######## 
# REMEMBER FOLKS  ::  NO resource :sessions 
#################################################################


########  SESSIONS ROUTES  ######## SIGN UP IS IN USER ROUTES ALREADY!! 
get '/signup' => 'users#new'
post '/signup' => 'users#create'

get 'login', to: "sessions#new"
post 'login', to: "sessions#create"
delete 'logout', to: "sessions#destroy"
#################################################################




#################################################################
  resources :users do

    resources :user_stylists
    # resources :stylists
  end

  resources :user_stylists
  resources :stylists
#################################################################




end






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