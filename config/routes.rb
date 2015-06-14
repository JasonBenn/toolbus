Rails.application.routes.draw do
  jsonapi_resources :tools
  jsonapi_resources :missions
end
