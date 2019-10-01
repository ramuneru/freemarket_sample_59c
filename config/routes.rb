Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources :items , only: [:index, :show, :new]
  resources :users , only: [:index] do
    collection do
      get 'profile'
      get 'logout'
      get 'check'
      get 'card'
      get 'card_create'
    end
  end
  resources :signup, only: [:index,:create] do
    collection do
      get 'profile'
      get 'phone'
      get 'phone_authen'
      get 'address'
      get 'credit'
      get 'complete'
    end
  end
end