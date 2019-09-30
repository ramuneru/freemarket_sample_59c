Rails.application.routes.draw do
  root "items#index"
  resources :users , only: [:index]
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
  end
end