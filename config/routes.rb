Skrimply::Application.routes.draw do
  devise_for :users

  resources :releases do
    resources :tracks, :only => [:create, :new]
  end

  resources :tracks
  resources :definitions, :only => [:create]

  resources :artists
  resources :definitions
  resources :genres
  resources :users, :only => [:index, :show]

  match '/about', to: 'static_pages#about'
  root to: 'static_pages#home'
end
