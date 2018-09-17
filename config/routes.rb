Rails.application.routes.draw do

  root 'pages#landing'

  get "directions" => "meetups#directions"

  get 'sessions/new'
  post 'sessions/new' => 'sessions#create'
  delete 'sessions/logout' => 'sessions#destroy'

  resources :pages
  resources :users
  resources :meetups


get "random_event" => "meetups#random"
get "cancel_event" => "meetups#cancel"
get "leave_event" => "meetups#leave"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
