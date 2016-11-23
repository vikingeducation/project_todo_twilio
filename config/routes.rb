Rails.application.routes.draw do
  get 'texts/send_text'

  root 'tasks#index'
  resources :tasks
end
