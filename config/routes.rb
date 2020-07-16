Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root 'welcome#home'
  resources :rides
  resources :users
  resources :attractions
  get '/signin', to: 'sessions#new', as: 'signin'
  post '/signin', to: 'sessions#create', as: 'session'
  delete '/signout', to: 'sessions#destroy', as: 'signout'
  
end
