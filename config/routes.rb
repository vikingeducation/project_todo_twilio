Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :tasks
  get 'tasks/done/:id',   to: 'tasks#done', as: 'done'
  get 'tasks/undone/:id', to: 'tasks#undone', as: 'undone'
  get 'texts/send/:id',   to: 'texts#send_text', as: 'send_text'
  get 'task/asc',         to: 'tasks#asc_sort', as: 'asc_sort'
  get 'task/desc',        to: 'tasks#desc_sort', as: 'desc_sort'
  get 'task/sticky/:id',  to: 'tasks#sticky', as: 'sticky'
  get 'task/unsticky/:id',to: 'tasks#unsticky', as: 'unsticky'
  get 'task/category',    to: 'tasks#category_sort', as: 'category_sort'
end
