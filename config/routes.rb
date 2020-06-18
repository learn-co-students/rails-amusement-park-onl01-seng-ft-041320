Rails.application.routes.draw do
  get '/users/new', to: 'users#new', as: 'new_user'
  root 'static#home'# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
