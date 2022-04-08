Rails.application.routes.draw do
  match "not_found", to: "errors#not_found", via: :all
  match "internal_server_error", to: "errors#internal_server_error", via: :all

  root 'home#index'
  get 'registers', to: 'registers#new'
  post 'registers', to: 'registers#create'
  get 'logins', to: 'logins#new'
  post 'logins', to: 'logins#create'
  delete 'logout', to: 'logins#destroy'
  
  get ':short_url', to: 'urls#show'

  resources :urls, only: [:index, :new, :create, :update, :edit]
end