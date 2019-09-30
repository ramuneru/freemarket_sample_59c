Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources :users , only: [:index]
  resources :signup, only: [:new]
  resources :items , only: [:index, :show, :new]
end
