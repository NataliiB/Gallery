Rails.application.routes.draw do
  devise_for :users

  root 'categories#index'
  resources :users
  resources :categories
  resources :articles

end
