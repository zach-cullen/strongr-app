Rails.application.routes.draw do
# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html  
  root 'pages#home'
  resources :users, only: [:new, :create, :show]


  #pretty urls
  get '/signup', to: 'users#new', as: :signup
end
