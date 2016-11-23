Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root :to => "tasks#index"

  resources :tasks

  get "/tasks/text-message/:id" => "tasks#text_message"
  get "/sort/:arg" => "tasks#sort"
end
