Rails.application.routes.draw do

  resources :tasks
  post 'reminder' => 'texts#send_text'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
