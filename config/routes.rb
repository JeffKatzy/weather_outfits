Rails.application.routes.draw do
  resources :users
  resources :outfits

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  root to: 'welcome#index'
  get '/signup' => 'users#new'
end