Rails.application.routes.draw do
  get 'category/index'
  root 'items#index'

  resources :items , only: [:index, :show, :new, :edit] do
    collection do
      get 'buy'
      post 'pay'
    end
  end
  resources :category, only: [:index]

  resources :users , only: [:index] do
    collection do
      get 'profile'
      get 'logout'
      get 'check'
      get 'card'
      get 'card_create'
    end
  end
  devise_for :users, controllers: {
    registrations: "users/registrations",
    sessions:      "users/sessions"  
  }
  devise_scope :user do
    get "sign_in",             to: "users/sessions#new"
    get "sign_out",            to: "users/sessions#destroy"
    get "index",               to: "users/registrations#index"
    get "profile",             to: "users/registrations#profile"
    get "phone",               to: "users/registrations#phone"
    get "phone_authentication",to: "users/registrations#phone_authen"
    get "address",             to: "users/registrations#address"
    get "credit",              to: "users/registrations#credit"
    get "complete",            to: "users/registrations#complete"
    post "complete",           to: "users/registzzrations#create"
  end
end