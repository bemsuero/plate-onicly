Rails.application.routes.draw do
root to: "users#new"

  get "directions" => "meetups#directions"

  get 'sessions/new'
  post 'sessions/new' => 'sessions#create'
  delete 'sessions/logout' => 'sessions#destroy'

  resources :users do
  resources :meetups
end
get "random_event" => "meetups#show"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
