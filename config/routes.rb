Rails.application.routes.draw do
  root 'users#new'
  get 'contact', to:  'static_pages#show'
  
  # ???   
  resources :cars
    
  resources :tasks   
  resources :ecms, only: %i[new create] 
  resources :models, only: %i[new create edit update]
  resources :users, only: %i[index show edit new create update]
  
  resources :makes do
    resources :models, only: :index
  end

  resources :clients do
    resources :cars
    resources :orders 
  end

  controller :sessions do
    get 'login'  =>  :new
    post 'login' =>  :create 
    get 'logout' =>  :destroy
  end
end
