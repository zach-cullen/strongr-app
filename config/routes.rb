Rails.application.routes.draw do
# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html  
  root 'pages#home'
  resources :users, only: [:show, :new, :create]
  resources :teams, only: [:index, :show, :new, :create] do 
    resources :workouts, only: [:new, :create]
  end
    
  resources :team_invites, only: [:show, :new, :create, :destroy]
  resources :workouts, only: [:show, :new, :create, :edit, :update]
  resources :metcons, only: [:create, :edit, :update]
  # resources :workout_metcons, only: [:update]
  resources :workout_metcon_scores, only: [:create]

  get '/app/wod', to: 'app#wod', as: :wod
  get '/app/home', to: 'app#home', as: :app_home
  get '/auth/google_oauth2/callback', to: 'sessions#google_login'
  get '/signup', to: 'users#new', as: :signup
  get '/login', to: 'sessions#new', as: :login
  post '/sessions', to: 'sessions#create'
  delete '/sessions', to: 'sessions#destroy', as: :logout
  delete '/workout/:id', to: 'workouts#destroy', as: :delete_workout
  delete '/workout_metcons/:id', to: 'workout_metcons#destroy', as: :delete_workout_metcon
end
