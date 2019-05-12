Rails.application.routes.draw do
  devise_for :clients
  get 'sessions/login'
  get 'sessions/logout'
  resources :accounts
  resources :clients
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/balance', to: 'accounts#balance'
  post '/transfer', to: 'transfer#transfer'
  post '/login', to: 'sessions#login'
  delete '/logout', to: 'sessions#logout'
end


