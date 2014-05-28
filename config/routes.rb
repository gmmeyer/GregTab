Rails.application.routes.draw do

  resource :session, only: [:new, :create, :destroy]

  resources :tournament, only: :show
  resources :round, only: [:show, :index]

  resources :user

  resources :tournament, only: [:new, :create, :update, :destroy] do
    resources :round, only: [:new, :create]
    resources :team, only: [:new, :create]

  end

  resources :round, only: [:update, :destroy]
  resources :round, only: [:update, :destroy]

  resources :school

end
