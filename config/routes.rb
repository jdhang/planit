Rails.application.routes.draw do
  root "sessions#home"

  get '/register', to: "users#new"
  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  get '/logout', to: "sessions#destroy"

  # profile routes
  get '/profile', to: "sessions#profile"
  get '/projects', to: "sessions#projects"
  get '/tasks', to: "sessions#tasks"

  resources :users
  resources :projects do
    resources :tasks
  end

end
