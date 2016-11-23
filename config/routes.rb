Rails.application.routes.draw do

  root "tasks#index"
  resources :tasks do
    resources :texts, only: :create
  end
  # post "/texts" => 'texts#send_text'

end
