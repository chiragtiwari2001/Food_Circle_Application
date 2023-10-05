Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

  devise_for :users
  resources :users, only: [:index, :show]
  
  resources :restaurants do
    resources :reviews, only: [:create, :destroy]
    resources :categories, only: [:new, :create, :destroy]
    get '/order', to: 'restaurants#order'
  end

  resources :carts, only: [] do
    collection do
      post 'add_cart'
      patch 'cart_update'
      delete 'remove_from_cart'
    end
  end

  resources :orders, only: [:index, :show] do
    collection do
      post 'create_order'
    end
  end

  resources :categories, only: [:show, :new, :create, :destroy] do
    resources :foods, only: [:create]
  end

  resources :foods, only: [:show]

  root 'home_pages#home'
  
  get '/help', to: 'home_pages#help'
  get '/about', to: 'home_pages#about'
  get '/contact', to: 'home_pages#contact'
end
