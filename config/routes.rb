Rails.application.routes.draw do
  root 'recipes#index'
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show, :edit, :update, :destroy]
  resources :recipes, only: [:index, :create, :show, :edit]
  get "/users" =>"users#new"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
