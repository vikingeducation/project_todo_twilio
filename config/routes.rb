Rails.application.routes.draw do
  root to: 'tasks#index'
  resources :tasks
  get "send_reminder/:id" => "texts#send_text"
end
