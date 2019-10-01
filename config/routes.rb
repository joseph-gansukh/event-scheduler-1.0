Rails.application.routes.draw do
  resources :events
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home#index'
  resources :users, except: [:index]
  resources :sessions, only: [:new, :create, :destroy]
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  post '/add_event', to: 'users#add_event', as: 'add_event'
  get 'logout', to: 'sessions#destroy', as: 'logout'
end
