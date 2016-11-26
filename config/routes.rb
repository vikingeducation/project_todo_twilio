Rails.application.routes.draw do

  root 'tasks#index'
  resources :tasks
  resources :tags, :only => [:show, :index]

  patch "/tasks/:id/update_single" => 'tasks#update_single', as:'update_single'

  get "/text/:id" => 'texts#send_sms', as:'send_sms'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end