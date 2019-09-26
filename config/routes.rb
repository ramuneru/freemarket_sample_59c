Rails.application.routes.draw do
  
  root  'items#index'
  get   'users/index' => 'users#index'
  
end
