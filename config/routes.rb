Rails.application.routes.draw do
  namespace :admins do
    resources :items do
      post 'get_songs', on: :collection
    end
    resources :artists, only: [:index, :edit, :create, :update, :destroy]
    resources :labels, only: [:index, :edit, :create, :update, :destroy]
    resources :genres, only: [:index, :edit, :create, :update, :destroy]
  end

  namespace :users do
    resources :items, only: [:index, :show]
  end
end
