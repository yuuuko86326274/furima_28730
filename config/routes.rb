Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  #resources :users, only: :show
  resources :items, only: [:index, :new, :show, :create] do
    resources :purchase_items, only: [:index, :create]
  end
end
