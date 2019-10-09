Rails.application.routes.draw do
  root 'items#index'

  resources :items , only: [:index, :show, :new, :edit] do
    member do
      get 'buy'
      post 'pay'
    end

  end

  resources :category, only: [:index]
  
  namespace :api do
    resources :category, only: :index, defaults: { format: 'json' } do
      collection do 
        get 'children'
        get 'grandchildren'
      end
    end
  end

  namespace :api do
    resources :size, only: :index, defaults: { format: 'json' } 
  end

  

  resources :users , only: [:index] do
    collection do
      get 'profile'
      get 'logout'
      get 'check'
      get 'card'
      get 'card_create'
      get 'product'
      get 'progress'
      get 'completed'
    end
  end
  resources :card, only: [:new,:show] do
    collection do
      post 'show',      to: 'card#show'
      post 'pay',       to: 'card#pay'
      post 'delete',    to: 'card#delete'
    end
  end
  devise_for :users, controllers: {
    registrations: "users/registrations",
    sessions:      "users/sessions",
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  devise_scope :user do
    post    "sign_in",             to: "devise/sessions#new"
    delete  "sign_out",            to: "devise/sessions#destroy"
    get     "index",               to: "users/registrations#index"
    get     "profile",             to: "users/registrations#profile"
    get     "phone",               to: "users/registrations#phone"
    get     "phone_authentication",to: "users/registrations#phone_authen"
    get     "address",             to: "users/registrations#address"
    get     "credit",              to: "users/registrations#credit"
    get     "complete",            to: "users/registrations#complete"
    post    "complete",            to: "devise/registrations#create"
  end
end