Rails.application.routes.draw do

  root 'users/items#index'

  devise_for :admins, controllers: {
    sessions: 'devise/admins/sessions',
    registrations: 'devise/admins/registrations',
    passwords: 'devise/admins/passwords'
  }


  devise_for :users, controllers: {
    sessions: 'devise/users/sessions',
    registrations: 'devise/users/registrations',
    passwords: 'devise/users/passwords'
  }

  namespace :admins do
    root 'items#index'
    resources :items do
      post 'get_songs', on: :collection
    end
    resources :artists, only: [:index, :edit, :create, :update, :destroy]
    resources :labels, only: [:index, :edit, :create, :update, :destroy]
    resources :genres, only: [:index, :edit, :create, :update, :destroy]
  end

  namespace :users, path: '' do
    resources :items, only: [:index, :show] do
      post 'get_songs', on: :collection
    end
    resource :users, only: [:show, :edit, :update] do
      get 'unsubscribe_confirm', on: :collection
      patch 'unsubscribe', on: :collection
    end
  end
end
