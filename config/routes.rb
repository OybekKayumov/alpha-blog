Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'pages#home'
  get 'about', to: 'pages#about'
  # resources :articles, only: [:show, :index, :new, :create, :edit, :update, :destroy]
  
  # we have all resources, we can write
  resources :articles
  
  # build a route and send to users controller and then new action
  get 'signup', to: 'users#new'
end

# 3
# to: controllerName#actionName

# 2 send it to pages
# root 'application#hello'

# 1
# root 'application'
# means it goes to 
# /app/controllers/application_controller.rb
