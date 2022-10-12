Rails.application.routes.draw do
  root 'users#new'
  get 'contact', to:  'static_pages#show'
  
  resources :ecms, only: %i[new create] 

  # ???   
  resources :cars

  resources :models, only: %i[new create edit update]
  resources :users, only: %i[new create edit update]
  
  resources :makes do
    resources :models, only: :index
  end

  resources :clients do
    resources :cars
    resources :orders 
  end

  controller :sessions do
  #  get 'login'  =>  :new
    post 'login' =>  :create 
    get 'logout' =>  :destroy
  end
end
