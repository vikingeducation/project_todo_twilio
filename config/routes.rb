Rails.application.routes.draw do

  post 'texts/send_text/:id', to: 'texts#send_text'
  post '/', to: 'tasks#index'

  root 'tasks#index'
  resources :tasks

end
