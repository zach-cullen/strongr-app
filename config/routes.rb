Rails.application.routes.draw do
# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html  
  root 'pages#home'
  resources :users, only: [:new, :create, :show]

  get '/signup', to: 'users#new', as: :signup
  get '/login', to: 'sessions#new', as: :login
  post '/sessions', to: 'sessions#create'
  delete '/sessions', to: 'sessions#destroy', as: :logout
end
