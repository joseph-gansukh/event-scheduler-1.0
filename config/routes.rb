Rails.application.routes.draw do
  resources :events
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home#index'
  resources :users, except: [:index]
  resources :sessions, only: [:new, :create, :destroy]
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  post '/attend_event', to: 'users#attend_event', as: 'attend_event'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  post 'send_friend_request', to: 'users#send_friend_request', as: 'friend_request'
  post 'accept_friend_request', to: 'users#accept_friend_request', as: 'accept_request'
  post 'decline_friend_request', to: 'users#decline_friend_request', as: 'decline_request'
  post 'remove_friend', to: 'users#remove_friend', as: 'remove_friend'
  post 'leave_event', to: 'events#leave_event', as: 'leave_event'
end
