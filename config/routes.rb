Rails.application.routes.draw do
  root to: 'users#home'
  resources :profiles, except: [:index]
  resources :friend_requests, except: [:index, :show, :new, :edit]
  devise_for :users
  resources :users, only: [:index, :show]
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
