Rails.application.routes.draw do
  root "sessions#home"

  get '/register', to: "users#new"
  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  get '/logout', to: "sessions#destroy"

  # profile routes
  get '/home', to: "sessions#home"
  get '/profile', to: "sessions#profile"
  get '/projects', to: "sessions#projects"
  get '/tasks', to: "sessions#tasks"

resources :users, except: [:index, :destroy]
  resources :projects, except: [:index] do
    member do
      post :complete
    end
    
    resources :tasks, except: [:index] do
      member do
        post :complete
      end
    end
  end

end
