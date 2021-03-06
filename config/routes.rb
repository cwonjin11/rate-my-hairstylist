Rails.application.routes.draw do


root "sessions#welcome"
get 'pages', to: 'pages#index'#, as:'pages'  


####### OmniAuth #################   google ###################################
# get '/auth/google_oauth2/callback', to: 'sessions#omniauth'
get '/auth/:provider/callback', to: 'sessions#omniauth'  #<= makes more dynamic
###############################################################################


########  SIGN UP ROUTES (custom)  ######## 
get '/signup', to: "users#new"
post '/signup', to: "users#create"


########  SESSIONS ROUTES  ########
get 'login', to: "sessions#new"
post 'login', to: "sessions#create"
delete 'logout', to: "sessions#destroy"
#################################################################



#################rested routes####################################
  resources :users, :except => [:index] do
    resources :user_stylists
  end
  resources :user_stylists

  resources :stylists, :except => [:destroy]

#################################################################


# match '*path' => redirect('/'), :via => [:get, :post] 
### localhost:3000/qwefkfqasdkfas;dlkfn to the root path/

end











# 🚧 # THINGS WE HAVE TO BUILD OUT
# get 'welcome', to: "sessions#welcome" 
# 🚧 #
######## 
# REMEMBER FOLKS  ::  NO resource :sessions 
#################################################################



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