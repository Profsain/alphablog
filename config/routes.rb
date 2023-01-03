Rails.application.routes.draw do
 root 'pages#home'

 get 'about', to: 'pages#about'
 get 'sign_up', to: 'users#new'

 resources :articles
 resources :users
end
