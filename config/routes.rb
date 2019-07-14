Rails.application.routes.draw do
  namespace :admins do
    get 'genres/index'
    get 'genres/edit'
  end
  namespace :admins do
    get 'labels/index'
    get 'labels/edit'
  end
  namespace :admins do
    get 'artists/index'
    get 'artists/edit'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
