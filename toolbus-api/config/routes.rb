Rails.application.routes.draw do
  resources :tools, only: [:index]
  resources :achievements, only: [:index]
  resources :users, only: [:index]
  resources :repos, only: [:index]
  resources :completions, only: [:index]
end
