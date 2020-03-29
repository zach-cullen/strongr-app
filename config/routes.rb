Rails.application.routes.draw do
# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html  
  root 'pages#home'
  resources :users, only: [:show, :new, :create]
  resources :teams, only: [:index, :show, :new, :create]
  resources :team_invites, only: [:show, :new, :create, :destroy]
  resources :workouts, only: [:show, :new, :create, :edit, :update, :destroy]
  resources :exercises, only: [:show, :new, :create, :destroy]

  get '/signup', to: 'users#new', as: :signup
  get '/login', to: 'sessions#new', as: :login
  post '/sessions', to: 'sessions#create'
  delete '/sessions', to: 'sessions#destroy', as: :logout
  delete '/workout_exercises/:id', to: 'workout_exercises#destroy', as: :disconnect_exercise
end
