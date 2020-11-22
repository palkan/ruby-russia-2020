# frozen_string_literal: true

Rails.application.routes.draw do
  get "/login", to: "sessions#new", as: :login
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy", as: :logout

  resource :dashboard, only: [:show]
  resources :artists, only: [:show]
  resources :favorites, only: [:index]

  root to: "dashboard#show"
end
