Skrimply::Application.routes.draw do
  devise_for :users

  resources :releases do
    resources :tracks, :only => [:create, :new]
  end

  resources :tracks do
    resources :defintions, :only => [:create]
  end

  resources :artists
  # REV: Typo in definitions?
  resources :defintions
  resources :genres
  resources :users, :only => [:index, :show]

  # REV: Use get instead of match, as you probably don't want to expose post, put, delete.
  match '/about', to: 'static_pages#about'
  root to: 'static_pages#home'
end
