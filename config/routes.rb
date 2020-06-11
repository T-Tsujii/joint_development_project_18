Rails.application.routes.draw do

  resources :messages

  resources :users

  resources :tasks
end
