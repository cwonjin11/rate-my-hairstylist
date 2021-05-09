Rails.application.routes.draw do
  resources :users do
    resources :user_stylists
  end
  resources :user_stylists
  resources :stylists
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
