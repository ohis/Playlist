Rails.application.routes.draw do
=begin
  get 'playlists/create'

  get 'playlists/new'

  get 'playlists/index'

  get 'songs/create'

  get 'songs/new'

  get 'songs/index'
=end
  root "sessions#new"
  post 'playlists/:id/add'   => 'playlists#add'
  post 'sessions' => 'sessions#create'
  delete 'sessions/:id' => 'sessions#destroy'
  resources :users
  resources :songs
  resources :playlists

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
