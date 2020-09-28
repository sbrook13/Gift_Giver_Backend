Rails.application.routes.draw do
  resources :interests
  resources :present_ideas
  resources :loved_ones
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
