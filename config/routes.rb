Rails.application.routes.draw do
 resources :users, only: [:index, :show] do
 resources :posts, only: [:index, :new, :create, :show] do
    resources :likes, only: [:create]
    resources :comments, only: [:new, :create]
 end
end
root 'users#index'
end
