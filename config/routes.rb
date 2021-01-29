Rails.application.routes.draw do
  get 'hello_world', to: 'hello_world#index'
  resources :algorithms, only: [:index, :show, :new, :create] do
    resources :examples, only: [:create]
  end
  root 'algorithms#home'
  get '/algorithms', to: 'algorithms#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
