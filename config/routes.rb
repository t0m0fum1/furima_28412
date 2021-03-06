Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users
  root to: 'items#index'
  resources :users, only: :create
  resources :items do
    resources :buys, only: [:new, :create]
  end
  resources :shipping_address, only: :create
end
