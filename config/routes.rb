Rails.application.routes.draw do

  root 'users/items#index'

  namespace :admins do
    root 'items#index'
    resources :items do
      post 'get_songs', on: :collection
    end
    resources :artists, only: [:index, :edit, :create, :update, :destroy]
    resources :labels, only: [:index, :edit, :create, :update, :destroy]
    resources :genres, only: [:index, :edit, :create, :update, :destroy]
    resources :users, only: [:index, :show, :edit, :update, :destroy]
    resources :addresses, only: :destroy
  end

  namespace :users, path: '' do
    resources :items, only: [:index, :show] do
      post 'get_songs', on: :collection
    end
    resource :users, only: [:show, :edit, :update] do
      get 'unsubscribe_confirm', on: :collection
      patch 'unsubscribe', on: :collection
    end
    resources :addresses, only: [:create, :edit, :update, :destroy]
    resources :cart_items, only: [:index, :create, :update, :destroy]
    resources :orders, only: [:index, :new, :create]
  end

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

end
