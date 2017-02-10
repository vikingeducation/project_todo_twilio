Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to => 'tasks#index'
  resources :tasks do
    patch 'done' => 'tasks#mark_done'
  end

  get 'send_text/:id(.:format)' => 'texts#send_text', as: :send_text

end
