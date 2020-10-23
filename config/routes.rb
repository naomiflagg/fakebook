Rails.application.routes.draw do
  root 'static_pages#home'
  devise_for :users
  
  resources :profiles, except: [:index]

  resources :users, only: [:index, :show] do
    resources :friend_requests, only: [:create, :destroy]
    resources :friendships, only: [:create]
    get 'friends', to: 'friendships#index'
    delete 'remove_friend/:id', to: 'friendships#destroy', as: 'remove_friend'
  end
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
