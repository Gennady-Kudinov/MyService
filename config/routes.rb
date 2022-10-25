Rails.application.routes.draw do
  root 'static_pages#show'
  get '/upload_file', to: 'files#upload_file' 
  get '/saveimages', to: 'orders#save_image'
  
  resources :files, only: %i[index]

  # ???   
  resources :cars
    
  get 'ecms', to: 'ecms#new'
  get 'models', to: 'models#new'
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
