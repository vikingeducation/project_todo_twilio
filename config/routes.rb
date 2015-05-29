Rails.application.routes.draw do
  root 'todos#index'
  resources 'todos', only: [:index, :create, :destroy, :update, :edit]
  post 'texts' => 'texts#send_message'
end