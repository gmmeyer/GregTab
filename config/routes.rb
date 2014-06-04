Rails.application.routes.draw do

  resource :session, only: [:new, :create, :destroy]

  resources :tournament, only: :show
  resources :round, only: [:show, :index,:update,:destroy]

  resources :users

  resources :tournament, only: [:new, :create, :update, :destroy] do
    resources :round, only: [:new, :create]
    resources :team, only: [:new, :create]
  end

  resources :school

  post '/pairings/:id/result', to: 'pairings#create_result', as: "create_result"
  get 'pairings/:id/double_loss', to: 'pairings#double_loss', as: "double_loss"

end