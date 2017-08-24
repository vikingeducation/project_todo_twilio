Rails.application.routes.draw do
  get 'tasks/index'

  get 'tasks/new'

  post 'tasks/create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'tasks#index'
  resources :tasks
end
