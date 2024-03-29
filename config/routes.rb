Rails.application.routes.draw do
  root 'static_pages#show'
  get '/upload_file', to: 'files#upload_file' 
  get '/saveimages', to: 'clients#save_image'
  
  resources :files

  resources :chats do 
    resources :messages 
  end
 
  resources :cars
  get '/view_car_orders/:id', to: 'cars#view_car_orders', as: 'view_car_orders'
  get '/view_car_order/:id', to: 'cars#view_car_order', as: 'view_car_order'
  post '/set_car_order/:id', to: 'cars#set_car_order', as: 'set_car_order'
    
  get 'models', to: 'models#new'
  resources :tasks   
  resources :models, only: %i[new create edit update]
  resources :users, only: %i[index show edit new create update]
  
  resources :makes do
    resources :models, only: :index
  end

  resources :clients do
    resources :cars
    resources :orders
  end
  resources :client, only: %i[index edit new create update destroy_all]

  controller :sessions do
    get 'login'  =>  :new
    post 'login' =>  :create 
    get 'logout' =>  :destroy
  end
  
  resources :articles do
   resources :comments, shallow: true
  end

   get 'static_pages', to: 'static_pages#index'

  resources :brand_ecus
  resources :model_ecus
  resources :soft_ecus
  resources :sw_idents
  get '/brand_ecus/:brand_ecu_id/model_ecus', to: 'model_ecus#index'
  get '/model_ecus/:model_ecu_id/soft_ecus', to: 'soft_ecus#index'
  get '/soft_ecus/:soft_ecu_id/sw_idents', to: 'sw_idents#index'

  get 'orders/search', to: 'orders#search', as: 'search_orders'
  get 'orders/copy_file', to: 'orders#copy_file', as: 'copy_file'

  resources :orders do
    get 'search', on: :collection
  end

  get '/orders/:id(.:format)', to: 'orders#show'


  resources :cars do
    resources :orders
  end

  delete '/clients', to: 'clients#destroy_all'

  resources :users do
      collection do
      get :online_users
    end
  end 

end
