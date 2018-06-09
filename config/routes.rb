Rails.application.routes.draw do

  root 'application#home'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  resources :users, only: [:index, :show, :edit, :update, :destroy]
  get '/users/active_recordings' => 'users#active_recordings'

  resources :shows do
    resources :characters, only: [:index, :new, :create, :edit, :update, :destroy]
  end

  resources :recordings, only: [:index, :new, :create, :update]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
