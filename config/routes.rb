Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources :users , only: [:index] do
    collection do
      get 'profile'
      get 'logout'
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