Rails.application.routes.draw do
  root to: "tasks#index"
  resources :tasks

  post "tasks/complete/:id", to: 'tasks#complete', as: 'complete'

  post "texts/reminder/:id", to: "texts#reminder", as: 'reminder' 

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
