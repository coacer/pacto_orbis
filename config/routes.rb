Rails.application.routes.draw do
  namespace :admins do
    resources :items
    resources :artists, only: [:index, :edit, :create, :update, :destroy]
    resources :labels, only: [:index, :edit, :create, :update, :destroy]
    resources :genres, only: [:index, :edit, :create, :update, :destroy]
  end
end
