Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:index, :show]
  
  root 'home_pages#home'
  
  get '/help', to: 'home_pages#help'
  get '/about', to: 'home_pages#about'
  get '/contact', to: 'home_pages#contact'
end
