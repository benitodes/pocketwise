Rails.application.routes.draw do
  get 'user_courses/create'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:show, :new] do
    member do
      get '/dashboard', to: 'users#dashboard', as: "dashboard"
    end
  end

  post "create_user", to: "users#create", as: "create_user"
  delete "destroy_user/:id", to: "users#destroy", as: "destroy_user"

  # wallet new and create happens in user controller

  resources :wallets, only: [:show, :edit, :update] do
    resources :goals, only: [:new, :create, :index]
  end

  resources :goals, only: [:edit, :update, :destroy]

  resources :categories, only: [:index] do
    resources :courses, only: [:index]
  end

  resources :courses, only: [] do
    resources :levels, only: [:index]
    resources :user_courses, only: [:create]
  end

  resources :levels, only: [:show] do
    resources :lectures, only: [:show]
    resources :questions, only: [:show]
    get 'increase_level', to: 'questions#increase_level'
  end



end
