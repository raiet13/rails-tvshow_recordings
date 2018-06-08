Rails.application.routes.draw do

  root 'application#home'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  resources :users, only: [:index, :show, :edit, :update, :destroy]

  resources :shows do
    resources :characters, only: [:new, :create, :edit, :update, :destroy]
  end

  resources :recordings, only: [:index, :create, :update]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
