Rails.application.routes.draw do
  devise_for :users

  root 'categories#index'
  resources :users
  resources :articles, only: [:new, :create]
  resources :categories do
    resources :articles
    end
end

