Rails.application.routes.draw do
  root to: "tasks#index"
  resources :tasks

  post "tasks/reminder/:id", to: "tasks#reminder", as: 'reminder'
  post "tasks/complete/:id", to: 'tasks#complete', as: 'complete'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
