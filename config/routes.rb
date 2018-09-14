Rails.application.routes.draw do
  root to: "users#new"

  resources :users
  resources :meetups

  get 'meetups/new'
  get 'meetups/edit'
  get 'meetups/index'
  get 'meetups/show'

  get 'users/new'
  get 'users/edit'
  get 'users/show'
  get 'users/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end