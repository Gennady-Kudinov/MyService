Rails.application.routes.draw do
  root 'users#new'
  get 'contact', to:  'static_pages#show'
  
  resources :cars
  get 'models', to: 'models#new'
  resources :models, only: %i[new create edit update]

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

  post 'clients/:id', to: 'clients#update'
  resources :clients do 
    resources :orders 
  end

  resources :users, only: %i[new create edit update]

  get 'ecms', to: 'ecms#new'
  post 'ecms', to: 'ecms#create'

  get 'orders', to: 'orders#show'
  post 'orders', to: 'orders#show'

end
