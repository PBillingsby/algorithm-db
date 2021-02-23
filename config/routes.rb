Rails.application.routes.draw do
  devise_for :users
  resources :algorithms, only: [:index, :show, :new, :create, :update, :destroy] do
    resource :examples, only: [:create]
    resource :articles, only: [:new, :create]
  end
  resources :examples, only: [:destroy]
  resources :articles, only: [:create, :show, :index]
  root 'users#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
