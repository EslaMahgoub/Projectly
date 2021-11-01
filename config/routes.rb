Rails.application.routes.draw do
  devise_for :users
  resources :users, only: %i[ index edit show update]
  resources :projects do
    get :created, on: :collection
  end
  root to: 'site#index'
end
