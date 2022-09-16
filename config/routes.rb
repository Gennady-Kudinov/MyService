Rails.application.routes.draw do
  root 'users#new'
  get 'contact', to:  'static_pages#show'
  
  resources :cars

  resources :makes do
    resources :models, only: :index
  end

  get 'car', to: 'clients#index'
  resources :clients do
    resources :cars
  end

  get 'admin', to: 'admin#index'

  controller :sessions do
    get 'login'  =>  :new
    post 'login' =>  :create 
    get 'logout' =>  :destroy
  end
  
  resources :orders 
  resources :users, only: %i[new create edit update]
end
