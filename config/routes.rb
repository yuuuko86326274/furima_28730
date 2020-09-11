Rails.application.routes.draw do
  get 'user_purchase_items/index'
  devise_for :users
  root to: 'items#index'

  resources :items do
    collection do
      get 'search'
    end
    resources :purchase_items, only: %i[index create]
  end
end
