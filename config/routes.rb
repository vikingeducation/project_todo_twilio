Rails.application.routes.draw do
  root 'tasks#index'
  resources :tasks
  post '/tasks/:id', to: 'tasks#soft_delete'
end
