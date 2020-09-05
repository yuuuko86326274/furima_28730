Rails.application.routes.draw do
  get 'user_purchase_items/index'
  devise_for :users
  root to: 'items#index'
  resources :items do
    resources :purchase_items, only: [:index, :new, :create]
  end
  resources :user_purchase_items, only: [:create]
end