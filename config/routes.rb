Rails.application.routes.draw do
  root 'pages#landing'
  get 'pages/home'
  get 'pages/about'
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
