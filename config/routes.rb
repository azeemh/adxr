Rails.application.routes.draw do
  authenticate :user do
    resources :affiliates, :offers, :tiers, only: [:new, :create, :edit, :update, :destroy]
  end
  resources :affiliates, :offers, :tiers, only: [:index, :show]
  namespace :admin do
    resources :users
    root to: "users#index"
  end
  root to: 'visitors#index'
  devise_for :users, controllers: { registrations: "registrations"}
  resources :users
end
