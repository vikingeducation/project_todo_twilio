Rails.application.routes.draw do
  root 'tasks#index'
  resources :tasks, :only => [:index, :show, :new, :create]
end
