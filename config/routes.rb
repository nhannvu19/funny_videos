Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users' }

  root 'videos#index'

  resources :videos, except: %i[show edit update destroy]
  resources :users, only: :create
end
