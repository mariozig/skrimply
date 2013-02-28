Skrimply::Application.routes.draw do
  resources :artists
  resources :releases do
    resources :tracks, :only => [:create, :new]
  end
  resources :tracks
  resources :genres

  match '/about', to: 'static_pages#about'
  root to: 'static_pages#home'
end
