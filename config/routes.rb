Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

  devise_for :users
  resources :users, only: [:index, :show]
  resources :restaurants do
    resources :reviews, only: [:create, :destroy]
  end  
  
  root 'home_pages#home'
  
  get '/help', to: 'home_pages#help'
  get '/about', to: 'home_pages#about'
  get '/contact', to: 'home_pages#contact'
end
