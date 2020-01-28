Rails.application.routes.draw do

  resources :users, only: [:new, :create]

  get 'login', to: 'session#new'
  post 'login', to: 'session#create'
  get 'welcome', to: 'session#welcome'
  get 'authorized', to: 'session#page_requires_login'
  get 'logout', to: 'session#logout'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
