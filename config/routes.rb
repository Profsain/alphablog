Rails.application.routes.draw do
  root 'pages#home'

  get 'about', to: 'pages#about'
  get 'sign_up', to: 'users#new'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'

  resources :articles
  resources :users

end
