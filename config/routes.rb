Rails.application.routes.draw do
  jsonapi_resources :tools
  jsonapi_resources :missions
  jsonapi_resources :completions
  jsonapi_resources :repos
  jsonapi_resources :users
end
