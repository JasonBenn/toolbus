Rails.application.routes.draw do
  resources :tools, only: [:index, :show]
  resources :missions, only: [:index]
  resources :users, only: [:index]
  resources :repos, only: [:index]
  resources :completions, only: [:index]
end
