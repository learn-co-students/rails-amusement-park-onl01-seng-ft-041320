Rails.application.routes.draw do
  root 'users#home'
  resources :users
  resources :attractions

  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  delete '/signout', to: 'sessions#destroy'
  post '/rides', to: "rides#create"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
