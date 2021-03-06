Skrimply::Application.routes.draw do
  devise_for :users

  resources :releases do
    resources :tracks, :only => [:create, :new]
  end

  resources :tracks do
    resources :definitions, :only => [:index]
  end

  resources :definitions, :only => [:create]
  resources :artists
  resources :genres
  resources :users, :only => [:index, :show]

  get '/about', to: 'static_pages#about'

  root to: 'static_pages#home'
end