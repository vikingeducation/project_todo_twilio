Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'tasks#index'
  resources :tasks

  get "tasks/:id/soft_delete(.:format)", :to => 'tasks#soft_delete'

end
