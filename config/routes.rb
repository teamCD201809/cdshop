Rails.application.routes.draw do
  root to: 'user/titles#index'
  devise_for :admins, controllers: {
  	sessions:       'admins/sessions',
  	passwords:      'admins/passwords',
  	registrations:  'admins/registrations'
  }
  devise_for :users, controllers: {
  	sessions:      'users/sessions',
  	passwords:     'users/passwords',
  	registrations: 'users/registrations'
  }
  namespace :admin do
    get 'titles/find', to: 'titles#find'
    resources :titles
    resources :artists
    resources :cart_items
    resources :delivery_addresses
    resources :discs
    resources :genres
    resources :labels
    resources :orders
    resources :orders_items
    resources :songs
    resources :users
  end
  namespace :user do
    get 'titles/find', to: 'titles#find'
    resources :titles
    resources :artists
    resources :cart_items
    resources :delivery_addresses
    resources :discs
    resources :genres
    resources :labels
    resources :orders
    resources :orders_items
    resources :songs
    resources :users
    get 'users/:id(.:format)/bye', to: 'users#bye'
  end
  # resources :genres
  # resources :artists
  # resources :labels
  resources :titles
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
