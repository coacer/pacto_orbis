Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'devise/users/sessions',
    registrations: 'devise/users/registrations',
    passwords: 'devise/users/passwords'
  }

  namespace :admins do
    resources :items do
      post 'get_songs', on: :collection
    end
    resources :artists, only: [:index, :edit, :create, :update, :destroy]
    resources :labels, only: [:index, :edit, :create, :update, :destroy]
    resources :genres, only: [:index, :edit, :create, :update, :destroy]
  end
end
