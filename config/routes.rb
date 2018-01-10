Rails.application.routes.draw do

  root to: 'pages#home'

  devise_for :users

  get '/profile', to: 'pages#profile', as: 'profile'

  resources :products do
    resources :reviews, except: [:index, :show]
  end

  resources :order_items
  resource :cart, only: [:show]

  resources :charges, only: [:new, :create]

end
