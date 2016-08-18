Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :tasks
  get 'tasks/done/:id', to: 'tasks#done', as: 'done'
  get 'tasks/undone/:id', to: 'tasks#undone', as: 'undone'
end
