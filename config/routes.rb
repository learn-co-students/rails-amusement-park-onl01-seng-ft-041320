Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :attractions
  resources :users
  get '/signin', to: 'session#signin'
  post '/create', to: 'session#create'
  # get '/attractions', to: "attractions#index"
  root 'application#application'
  # get '/attractions/new', to: "attractions#new"
  # post '/attractions', to: 'attractions#create'
  # get '/attractions/:id', to: 'attractions#show'
  post '/rides', to: 'rides#create'
  delete '/logout', to: 'session#delete'
end
