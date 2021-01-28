Rails.application.routes.draw do
  resources :algorithms, only: [:index, :show, :new, :create] do
    resources :examples, only: [:create]
  end
  root 'algorithms#home'
  get '/algorithms', to: 'algorithms#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
