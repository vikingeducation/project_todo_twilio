Rails.application.routes.draw do

  root to: "todos#index"
  resources :users do
    resources :todos
  end
  post '/texts', to: 'texts#send_text'

end
