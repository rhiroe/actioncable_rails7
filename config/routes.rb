Rails.application.routes.draw do
  devise_for :users

  root to: 'rooms#index'
  resources :rooms, only: :show do
    resources :messages, only: :create
  end
end
