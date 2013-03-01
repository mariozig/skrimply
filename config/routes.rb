Skrimply::Application.routes.draw do
  devise_for :users

  resources :releases do
    resources :tracks, :only => [:create, :new]
  end

  resources :tracks do
    resources :defintions, :only => [:create]
  end

  resources :artists
  resources :defintions
  resources :genres
  resources :users, :only => [:index, :show]

  match '/about', to: 'static_pages#about'
  root to: 'static_pages#home'
end
