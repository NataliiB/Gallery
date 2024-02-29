Rails.application.routes.draw do
  devise_for :users
  root 'categories#index'
  resources :articles, only: %i[new create]
  resources :categories do
    resources :articles
  end
end
