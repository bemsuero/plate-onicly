Rails.application.routes.draw do

  root 'pages#landing'

  get "directions" => "meetups#directions"

  get 'sessions/new'
  post 'sessions/new' => 'sessions#create'
  delete 'sessions/logout' => 'sessions#destroy'

  resources :pages
  resources :users do
  resources :meetups
end

get "random_event" => "meetups#random"
get "cancel_event" => "meetups#cancel"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
