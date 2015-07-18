Rails.application.routes.draw do

  root to: "todos#index"
  resources :todos
  get '/texts/:id', to: 'texts#send_text'

end
