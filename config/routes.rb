Rails.application.routes.draw do
  get '/help', to: 'home_pages#help'
  get '/about', to: 'home_pages#about'
  get '/contact', to: 'home_pages#contact'

  root 'home_pages#home'
end
