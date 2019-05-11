Rails.application.routes.draw do
  resources :accounts
  resources :clients
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/balance', to: 'accounts#balance'
  post '/transfer', to: 'transfer#transfer'
end


