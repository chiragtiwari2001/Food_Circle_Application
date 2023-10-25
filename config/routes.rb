Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?

  devise_for :users
  resources :users, only: %i[index show edit update destroy] do
    get '/profile', to: 'users#profile'
  end

  resources :restaurants do
    resources :reviews, only: %i[create destroy]
    # resources :categories, only: %i[new create destroy]
    get '/order', to: 'restaurants#order'
  end

  resources :carts, only: [] do
    collection do
      post 'add_to_cart'
      patch 'cart_update'
      delete 'remove_from_cart'
    end
  end

  resources :orders, only: %i[index show] do
    collection do
      post 'create_order'
      patch 'order_status'
    end
  end

  resources :categories, only: %i[show new create edit update destroy] do
    resources :foods, only: %i[new create]
  end

  resources :foods, only: [:show]

  root 'home_pages#home'

  get '/all_orders', to: 'orders#all_orders'
  get '/help', to: 'home_pages#help'
  get '/about', to: 'home_pages#about'
  get '/contact', to: 'home_pages#contact'
end
