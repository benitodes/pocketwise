Rails.application.routes.draw do
  get 'users/dashboard'
  get 'users/new'
  get 'users/create'
  get 'users/destroy'
  get 'questions/show'
  get 'lectures/show'
  get 'levels/index'
  get 'levels/show'
  get 'categories/index'
  get 'courses/index'
  get 'wallets/edit'
  get 'wallets/show'
  get 'wallets/update'
  get 'goals/index'
  get 'goals/new'
  get 'goals/create'
  get 'goals/edit'
  get 'goals/update'
  get 'goals/destroy'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:show, :new, :create] do
    member do
      get '/dashboard', to: 'users#dashboard', as: "dashboard"
    end
  end

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
  end

  resources :levels, only: [:show] do
    resources :lectures, only: [:show]
    resources :questions, only: [:show]
  end

end
