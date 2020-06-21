Rails.application.routes.draw do
  devise_for :users

  root 'home#index'

  resources :documents do
    resources :permissions
  end
end
