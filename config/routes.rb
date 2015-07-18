Rails.application.routes.draw do

  root to: "users#index"
  resources :users do
    resources :todos
  end
  post '/texts', to: 'texts#send_text'

end
