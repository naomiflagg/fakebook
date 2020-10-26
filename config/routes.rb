Rails.application.routes.draw do
  root 'static_pages#home'
  devise_for :users
  
  resources :users, only: [:index, :show] do
    resources :friend_requests, only: [:create, :destroy]
    resources :friendships, only: [:create]  
    get 'friends', to: 'friendships#index'
    delete 'remove_friend/:id', to: 'friendships#destroy', as: 'remove_friend'
  end

  resources :profiles, except: [:index, :show]
  resources :posts, except: [:index] do
    resources :comments, except: [:index, :show]
  end
end
