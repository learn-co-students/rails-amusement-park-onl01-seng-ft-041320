Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html'
  root "welcome#home"
  resources :users
  get '/signin', to: 'sessions#new'
  post '/signup', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  resources :attractions
  resources :rides, only: [:create]
end
