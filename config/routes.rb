Rails.application.routes.draw do
  root 'home#index'
  get 'registers', to: 'registers#new'
  post 'registers', to: 'registers#create'
  get 'logins', to: 'logins#new'
  post 'logins', to: 'logins#create'
  delete 'logout', to: 'logins#destroy'

  resources :urls, only: [:index, :new, :create, :show, :update, :edit]
end