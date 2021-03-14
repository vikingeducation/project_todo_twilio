Rails.application.routes.draw do

  root 'tasks#index'
  devise_for :users
  resources :tasks
  resources :favorites, only: [:create, :destroy]
  resources :categories, only: [:index]

end
