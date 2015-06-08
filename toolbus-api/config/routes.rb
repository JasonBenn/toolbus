Rails.application.routes.draw do
  resources :users, only: [:index]
  resources :achievements, only: [:index]
  resources :tools, only: [:index]
end
