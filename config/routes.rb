Rails.application.routes.draw do
   devise_for :users
   resources :users, only: [:index, :show] do
     resources :posts, only: [:index, :new, :create, :show, :destroy] do
       resources :comments, only: [:new, :create, :destroy]
       resources :likes, only: [:create]
     end
   end
 
   # api routes
   namespace :api do
     resources :users, only: [:index, :show] do
       resources :posts, only: [:index], format: :json do
         resources :comments, only: [:index, :create], format: :json
       end
     end
   end
 
   root "users#index"
 end